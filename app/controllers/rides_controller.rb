class RidesController < ApplicationController

  def new
    ride = Ride.new(user_id: params[:user_id], attraction_id: params[:attraction_id])
    if ride.save
      ride_error = ride.take_ride
      if ride_error.class == String
        redirect_to user_path(current_user), flash: {error: "#{ride_error}"}
      else
        redirect_to user_path(current_user), flash: {notice: "Thanks for riding the #{ride.attraction.name}!"}
      end
    else
      redirect_to user_path(current_user), flash: {alert: 'There was an error.'}
    end
  end

end
