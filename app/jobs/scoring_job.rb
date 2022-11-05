class ScoringJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Pool.all.each do |pool|
      # Game.all.each do |game|
      game = Game.find_by(id: 11)
  
      result = 0
      if pool.pred_first_team_score == game.first_team_score && pool.pred_second_team_score == game.second_team_score
          result = 3
      elsif pool.pred_first_team_score == game.first_team_score && pool.pred_second_team_score != game.second_team_score
          result = 2
      elsif pool.pred_first_team_score != game.first_team_score && pool.pred_second_team_score == game.second_team_score
          result = 2 
      # elsif pool.pred_first_team_score > game.first_team_score && pool.pred_second_team_score > game.second_team_score
      #     result = 1
      # elsif pool.pred_first_team_score < game.first_team_score && pool.pred_second_team_score < game.second_team_score
      #     result = 1 
      else pool.pred_first_team_score != game.first_team_score && pool.pred_second_team_score != game.second_team_score
          result =0
      end
      pool.points = result
      pool.save
      
      puts 'done'
    # end
    end
  end
end
