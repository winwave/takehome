class UserController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @user = User.find_or_create_by(uid: params[:uid])
    @user.update(time_zone: params[:timeZone])
    @user.set_schedule
    if @user.send_triggered?
      @user.update(triggered: true )
      @json = {
        uid: params[:uid],
        timeZone: params[:timeZone],
        scheduledDate: Time.now + 2.minutes,
      }
    end

    return if @user.notification_times.blank?

    @user.notification_times.each do |notification_time|
      if @user.match_schedule?(notification_time.scheduled)
        @json =  {
          uid: params[:uid],
          timeZone: params[:timeZone],
          scheduledDate: scheduled,
        }
        notification_time.destroy!
      end
    end

    return if @json.blank?

    render json: @json
  end
end
