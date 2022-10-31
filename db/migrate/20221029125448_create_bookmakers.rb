class CreateBookmakers < ActiveRecord::Migration[7.0]
  def change
    create_table :bookmakers do |t|
      t.string :name
      t.boolean :mobile_app
      t.timestamps
    end
  end
end
