class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.date :date
      t.string :first_team_name
      t.string :second_team_name


      t.timestamps
    end
  end
end
