class User < ApplicationRecord
  has_many :notification_times

  def set_schedule
    to_day_from = Time.parse("#{Time.now.to_date} 19:00:00")
    to_day_to = Time.parse("#{Time.now.to_date} 21:00:00")
    notification_times.create(scheduled: random_time(to_day_from, to_day_to))

    tomorrow_from = Time.parse("#{(Time.now + 1.day).to_date} 8:00:00")
    tomorrow_to = Time.parse("#{(Time.now + 1.day).to_date} 12:00:00")
    notification_times.create(scheduled: random_time(tomorrow_from, tomorrow_to))


  end

  def random_time(from, to)
    Time.at((to.to_f - from.to_f)*rand + from.to_f).to_datetime
  end

  def send_triggered?
    !@user.triggered && Time.zone.now - 10.seconds <= @user.created_at || Time.zone.now + 10.seconds >= @user.created_at
  end

  def match_schedule?(scheduled_date)
    Time.now.in_time_zone(time_zone) - 10.seconds <= scheduled_date || Time.now.in_time_zone(time_zone) + 10.seconds >= scheduled_date
  end
end
