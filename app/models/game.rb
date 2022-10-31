class Game < ApplicationRecord
    validates :first_team_name, presence: true
    validates :second_team_name, presence: true
    
    
    after_validation :message_after
    

    def message_after
        puts "A new great match #{self.first_team_name} against #{self.second_team_name} is goint to take place on the #{self.date} , we are waiting for your bets!"
    end
end
