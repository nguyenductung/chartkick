class CreateViews < ActiveRecord::Migration
  def change
    create_table :views do |t|
      t.string :country
      t.integer :duration
      t.string :os
      t.string :browser

      t.timestamps
    end
  end
end
