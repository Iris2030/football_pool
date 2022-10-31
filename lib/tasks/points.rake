namespace :check do
    
    desc "this task starts the game"
    task :game => :environment do
        puts "the game is about to begin!"
        Pool.where("games_id = 4").find_each do |pool|
            pool.update(
                first_team_score: 3,
                second_team_score: 2
            )
        end
        game = Game.find_by(id: 4)
        pool = Pool.find_by(games_id: 4)
        if pool.first_team_score > pool.second_team_score
            puts "#{game.first_team_name} beat #{game.second_team_name}  #{pool.first_team_score}:#{pool.second_team_score} "
        else
            puts "#{game.second_team_name} beat #{game.first_team_name}  #{pool.second_team_score}:#{pool.first_team_score} "
        end

        Pool.where("games_id = 7").find_each do |pool|
            pool.update(
                first_team_score: 1,
                second_team_score: 4
            )
        end
        game = Game.find_by(id: 7)
        pool = Pool.find_by(games_id: 7)
        if pool.first_team_score > pool.second_team_score
            puts "#{game.first_team_name} beat #{game.second_team_name}  #{pool.first_team_score}:#{pool.second_team_score} "
        else
            puts "#{game.second_team_name} beat #{game.first_team_name}  #{pool.second_team_score}:#{pool.first_team_score} "
        end
    end
    
    desc "this task counts points"
    task :points => :environment do
        Pool.all.each do |pool|
            # puts pool.pred_first_team_score = pool.first_team_score
            result = 0
            if pool.pred_first_team_score == pool.first_team_score && pool.pred_second_team_score == pool.second_team_score
                result += 3
            elsif pool.pred_first_team_score == pool.first_team_score && pool.pred_second_team_score != pool.second_team_score
                result += 2
            elsif pool.pred_first_team_score != pool.first_team_score && pool.pred_second_team_score == pool.second_team_score
                result += 2 
            elsif pool.pred_first_team_score > pool.first_team_score && pool.pred_second_team_score > pool.second_team_score
                result += 1
            elsif pool.pred_first_team_score < pool.first_team_score && pool.pred_second_team_score < pool.second_team_score
                result += 1 
            else pool.pred_first_team_score != pool.first_team_score && pool.pred_second_team_score != pool.second_team_score
                result +=0
            end
            pool.points = result
            pool.save
            
            puts 'done'
        end
    end
    
    desc "this task determins the winners"
    task :winner => :environment do
        winners1 =[]
        winners2 =[]
        winners3 =[]
        
        Pool.all.each do |pool|
            
            if pool.points == 3
                winners1.push(pool.users_id)
                
            elsif pool.points == 2
                winners2.push(pool.users_id)
                
            elsif pool.points == 1
                winners3.push(pool.users_id)
                
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