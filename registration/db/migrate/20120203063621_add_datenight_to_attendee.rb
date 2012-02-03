class AddDatenightToAttendee < ActiveRecord::Migration
  def change
    add_column :attendees, :datenight, :string

  end
end
