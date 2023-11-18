class IceCubeRuleService
  attr_accessor :user_calendar_training
  attr_accessor :schedule

  def initialize(user_calendar_training)
    @user_calendar_training = user_calendar_training
    @schedule = IceCube::Schedule.new
  end

  def set_ical(ical)
    @user_calendar_training.icube_rule = ical
  end

  def explain_rule
    rule = IceCube::Schedule.from_ical(@user_calendar_training.icube_rule)
    rule.to_s
  end

  def every_day!
    @schedule.add_recurrence_rule IceCube::Rule.daily
    @user_calendar_training.icube_rule = @schedule.to_ical
    explain_rule
  end

  def every_week_days!(*days)
    @schedule = IceCube::Schedule.new
    days.map!(&:downcase).map!(&:to_sym)
    @schedule.add_recurrence_rule IceCube::Rule.weekly.day(days)
    @user_calendar_training.icube_rule = @schedule.to_ical
    explain_rule
  end

  def monday!
    every_week_days! "monday"
  end

  def friday!
    every_week_days! "friday"
  end

end
