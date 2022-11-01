class Game < ApplicationRecord
    validates :first_team_id, presence: true
    validates :second_team_id, presence: true
    
    
    # after_validation :message_after
    
    enum status: {
        pre: "expected",
        live: "ended"
    }

    # def message_after
    #     puts "A new great match #{self.game.} against #{self.second_team_name} is goint to take place on the #{self.date} , we are waiting for your bets!"
    # end

    has_many :pools


    has_one :first_team, foreign_key: "first_team_id"
    has_one :second_team, foreign_key: "second_team_id"




end
