class AlterPools < ActiveRecord::Migration[7.0]
  def change
    remove_column :pools, :last_team_score, :integer
    add_column :pools, :second_team_score, :integer
  end
end
