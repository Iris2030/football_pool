class CreatePools < ActiveRecord::Migration[7.0]
  def change
    create_table :pools do |t|
      t.string :type_of_bet
      t.integer :pred_first_team_score
      t.integer :pred_second_team_score
      t.integer :bet
      t.integer :points
      t.timestamps
    end

      add_reference :pools, :users, foreign_key: true
      add_reference :pools, :bookmakers, foreign_key: true
      add_reference :pools, :games, foreign_key: true
  end
end
