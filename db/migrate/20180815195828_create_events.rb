class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :description
      t.float :long
      t.float :lat
      t.string :venue_name
      t.string :address
      t.string :city
      t.string :country
      t.string :event_url
      t.string :name
      t.integer :duration
      t.string :time
      t.string :group_name
      t.string :group_who
      t.integer :meetup_id
      t.string :photo_url

      t.timestamps
    end
  end
end
