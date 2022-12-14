namespace :check do
    
    desc "this task starts the game"
    task :game => :environment do
        puts "the game is about to begin!"
        
        Game.where("id = 1").find_each do |game|
            game.update(
                first_team_score: 1,
                second_team_score: 4
            )
        end
    end

    desc "this task starts the game"
    task :user => :environment do
puts current_user
    end


    
    desc "this task counts points"
    task :points => :environment do
        Pool.all.each do |pool|
            game = Game.find_by(id: pool.game_id)

puts pool.pred_first_team_score.to_s + " " +  game.first_team_score.to_s
puts pool.pred_second_team_score.to_s + " " + game.second_team_score.to_s

            puts  pool.pred_first_team_score < game.first_team_score && pool.pred_second_team_score < game.second_team_score
            result = 0
            if pool.pred_first_team_score == game.first_team_score && pool.pred_second_team_score == game.second_team_score
                result = 3
            elsif pool.pred_first_team_score == game.first_team_score && pool.pred_second_team_score != game.second_team_score
                result = 2
            elsif pool.pred_first_team_score != game.first_team_score && pool.pred_second_team_score == game.second_team_score
                result = 2 
            elsif pool.pred_first_team_score > game.first_team_score && pool.pred_second_team_score > game.second_team_score
                result = 1
            elsif pool.pred_first_team_score < game.first_team_score && pool.pred_second_team_score < game.second_team_score
                result = 1 
            else pool.pred_first_team_score != game.first_team_score && pool.pred_second_team_score != game.second_team_score
                result =0
            end
            pool.points = result
            pool.save
            

        end
    end
    
    desc "this task determins the winners"
    task :winner => :environment do
        winners1 =[]
        winners2 =[]
        winners3 =[]
        
        Pool.all.each do |pool|
            
            if pool.points == 3
                winners1.push(pool.user_id)
                
            elsif pool.points == 2
                winners2.push(pool.user_id)
                
            elsif pool.points == 1
                winners3.push(pool.user_id)
                
            end
            
        end
        
        if winners1.length > 0
            winners1.each do |winner|
                user = User.find_by(id: winner)
                puts "Our winner : #{user.first_name} #{user.last_name }!"
            end
        elsif  winners2.length > 0
            winners2.each do |winner|
                user = User.find_by(id: winner)
                puts "Our winner : #{user.first_name} #{user.last_name }!"
                
            end
        else 
            winners3.each do |winner|
                user = User.find_by(id: winner)
                puts "Our winner : #{user.first_name} #{user.last_name }!"
                
            end
        end
        
    end
end