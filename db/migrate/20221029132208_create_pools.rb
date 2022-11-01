class CreatePools < ActiveRecord::Migration[7.0]
  def change
    create_table :pools do |t|
      t.integer :pred_first_team_score
      t.integer :pred_second_team_score
      t.integer :points

      t.timestamps
    end

      add_reference :pools, :user, foreign_key: true
      add_reference :pools, :game, foreign_key: true
  end
end
