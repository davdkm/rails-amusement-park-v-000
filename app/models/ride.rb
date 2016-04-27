class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if attraction.tickets > user.tickets && attraction.min_height > user.height
      "Sorry. You do not have enough tickets the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif self.attraction.tickets > self.user.tickets
      "Sorry. You do not have enough tickets the #{attraction.name}."
    elsif self.attraction.min_height > self.user.height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      user.update(tickets: (user.tickets -= attraction.tickets), nausea: (user.nausea += attraction.nausea_rating), happiness: (user.happiness += attraction.happiness_rating))
    end
  end
end
