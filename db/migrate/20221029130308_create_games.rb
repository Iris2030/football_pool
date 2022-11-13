class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.date :date
      t.bigint :first_team_id
      t.bigint :second_team_id
      t.integer :first_team_score
      t.integer :second_team_score
      t.string :status
      t.timestamps
    end
    add_foreign_key :games, :teams, column: :first_team_id
    add_foreign_key :games, :teams, column: :second_team_id

 
  end
end
