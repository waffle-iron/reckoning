class User < ActiveRecord::Base
  devise :two_factor_authenticatable, :two_factor_backupable, :confirmable, :async, :lockable, :recoverable,
         :registerable, :rememberable, :trackable, :validatable,
         otp_secret_encryption_key: Rails.application.secrets[:devise_otp],
         otp_backup_code_length: 32, otp_number_of_backup_codes: 10

  belongs_to :account
  has_many :timers

  before_save :update_gravatar_hash
  before_save :ensure_authentication_token

  validates :email, email: true

  def update_gravatar_hash
    if gravatar.blank?
      hash = Digest::MD5.hexdigest(id.to_s)
    else
      hash = Digest::MD5.hexdigest(gravatar.downcase.strip)
    end
    self.gravatar_hash = hash
  end

  def ensure_authentication_token
    return if authentication_token.present?
    self.authentication_token = generate_authentication_token
  end

  def send_welcome
    token = set_reset_password_token
    UserMailer.welcome_mail(self, token).deliver
  end

  private def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end
end
