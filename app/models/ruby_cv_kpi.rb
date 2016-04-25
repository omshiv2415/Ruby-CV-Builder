class RubyCvKpi < KPI::Report
  def users_count
    result "Users count", User.count, :description => "Total users count"
  end
  def today_registrations_count
    result "Today registrations count", User.where("created_at > ?", @time - 24.hours)
  end
  def today
    ((time - 24.hours)..time)
  end
  def education_count
    result "Education count", EducatioalQualification.count, :description => "Total Educational Qualification
    count"
  end
end