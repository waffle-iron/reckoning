class Project < ActiveRecord::Base
  DEFAULT_ROUND_UP_OPTIONS = {
    "Nicht aufrunden" => 10.0,
    "Auf 15 Minuten" => 4.0,
    "Auf 30 Minuten" => 5.0,
    "Auf 1 Stunde" => 1.0
  }.freeze

  belongs_to :customer
  has_many :invoices, dependent: :destroy
  has_many :tasks, dependent: :destroy, inverse_of: :project
  has_many :timers, through: :tasks

  validates :customer_id, :name, :rate, presence: true

  accepts_nested_attributes_for :tasks, allow_destroy: true

  delegate :name, to: :customer, prefix: true

  include Workflow
  workflow do
    state :active do
      event :archive, transitions_to: :archived
    end
    state :archived do
      event :unarchive, transitions_to: :active
    end
  end

  def label
    name_with_customer
  end

  def self.active
    with_active_state
  end

  def self.archived
    with_archived_state
  end

  def self.with_budget
    where.not(budget: 0).where(budget_on_dashboard: true)
  end

  def name_with_customer
    "#{customer.name} - #{name}"
  end

  def timer_values
    values = 0.0
    timers.each do |timer|
      values += timer.value.to_d unless timer.value.blank?
    end
    values
  end

  def timer_values_billable
    values = 0.0
    timers.billable.each do |timer|
      values += timer.value.to_d unless timer.value.blank?
    end
    values
  end

  def timer_values_invoiced
    values = 0.0
    timers.each do |timer|
      if timer.value.present? && timer.position_id.present?
        values += timer.value.to_d
      end
    end
    values
  end

  def timer_values_uninvoiced
    values = 0.0
    timers.billable.each do |timer|
      if timer.value.present? && timer.position_id.blank?
        values += timer.value.to_d
      end
    end
    values
  end

  def invoice_values
    values = 0.0
    invoices.each do |invoice|
      values += invoice.value.to_d
    end
    values
  end

  def budget_percent
    if budget_hours.present?
      timer_values / budget_hours * 100
    else
      invoice_values / budget * 100
    end
  end

  def budget_percent_invoiced
    return if budget_hours.blank?
    timer_values_invoiced / budget_hours * 100
  end

  def budget_percent_uninvoiced
    return if budget_hours.blank?
    timer_values_uninvoiced / budget_hours * 100
  end
end
