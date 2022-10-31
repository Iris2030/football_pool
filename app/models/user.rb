class User < ApplicationRecord
    validates :first_name, presence: true
    validates :last_name, presence: true
    # devise :database_authenticatable, :registerable,
    # :recoverable, :rememberable, :validatable


    before_create :message_before
    after_create :message_after

    def message_before
        puts "New User is about to be with us!"
    end

    def message_after
        puts "Hello dear #{self.first_name} #{self.last_name}, happy to have you in our gambling society!"
    end
end
  