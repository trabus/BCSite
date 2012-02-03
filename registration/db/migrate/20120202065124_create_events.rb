class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.string :location
      t.string :zipcode
      t.text :description

      t.timestamps
    end
  end
end
