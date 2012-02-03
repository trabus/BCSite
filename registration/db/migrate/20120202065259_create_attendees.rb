class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.string :username
      t.string :realname
      t.string :email
      t.text :emergency_info
      t.decimal :price
      t.decimal :amount
      t.decimal :fee
      t.boolean :paid
      t.string :txn
      t.references :event

      t.timestamps
    end
    add_index :attendees, :event_id
  end
end
