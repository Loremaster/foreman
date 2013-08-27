class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :people_count
      t.integer :price
      t.integer :country_id

      t.timestamps
    end
  end
end
