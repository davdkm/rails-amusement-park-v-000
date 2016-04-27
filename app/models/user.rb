class User < ActiveRecord::Base
  # write associations here
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if nausea > happiness
      'sad'
    elsif nausea < happiness
      'happy'
    end
  end
end
