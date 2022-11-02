class Pool < ApplicationRecord

    validates :pred_first_team_score, presence: true
    validates :pred_second_team_score, presence: true
    


    belongs_to :game
    belongs_to :user
end

pool = Pool.find_by(id: 1)

