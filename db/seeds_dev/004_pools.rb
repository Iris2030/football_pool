user1 = User.find_by(id: 1)
user2 = User.find_by(id: 2)
user3 = User.find_by(id: 3)
user4 = User.find_by(id: 4)
user5 = User.find_by(id: 5)
# user6 = User.find_by(id: 6)
# user7 = User.find_by(id: 7)



game1 = Game.find_by(id: 1)
game2 = Game.find_by(id: 2)
game3 = Game.find_by(id: 3)
game4 = Game.find_by(id: 4)
game5 = Game.find_by(id: 5)
game6 = Game.find_by(id: 6)
game7 = Game.find_by(id: 7)
# game8 = Game.find_by(id: 8)


Pool.find_or_create_by(
    user_id: user4.id,
    game_id: game7.id,
    pred_first_team_score: Faker::Number.between(from: 0, to: 4),
    pred_second_team_score: Faker::Number.between(from: 0, to: 4),
)

# Pool.find_or_create_by(
#     user_id: user2.id,
#     bookmaker_id: bookmaker1.id,
#     game_id: game6.id,
#     pred_first_team_score: Faker::Number.between(from: 0, to: 4),
#     pred_second_team_score: Faker::Number.between(from: 0, to: 4),
#     bet: Faker::Number.between(from: 100, to: 1000),

# )

