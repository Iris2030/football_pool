class Bookmaker < ApplicationRecord
    validates :name, presence: true

    before_create :message_before
    after_create :message_after

    def message_before
        puts "Now we gonna create a new bookmaker, that is owesome!"
    end

    def message_after
        puts "Yeeeah! Bookmaker #{self.name} was created!"
    end


    # belongs_to :pool
end
