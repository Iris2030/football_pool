class AlterTeams < ActiveRecord::Migration[7.0]
  def change
 add_column :teams, :name, :string
 add_column :teams, :country, :string
 add_column :teams, :founded, :int
 add_column :teams, :leauge, :string
  end
end
