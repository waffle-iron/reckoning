module ProjectHelper
  def budget_progress(budget_percent)
    if budget_percent.to_f > 90.0
      "progress-bar-danger"
    elsif budget_percent.to_f > 70.0
      "progress-bar-warning"
    else
      "progress-bar-success"
    end
  end
end
