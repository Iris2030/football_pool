class Team < ApplicationRecord
    validates :name, presence: true

    # belongs_to :game, optional: true
    has_many :games

end

# team = Team.find_by(id: 1)

# puts team.games