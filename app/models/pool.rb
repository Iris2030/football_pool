class Pool < ApplicationRecord

    validates :pred_first_team_score, presence: true
    validates :pred_second_team_score, presence: true
    validates :bet, presence: true
    # validates :first_team_score, presence: true
    # validates :second_team_score, presence: true

    # has_many :games
    enum type_of_bet: {
        pre: "pre",
        live: "live"
    }
end
