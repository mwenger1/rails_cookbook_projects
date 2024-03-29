class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :start_date
      t.datetime :start_time
      t.string :location
      t.text :agenda
      t.text :address
      t.integer :organizer_id

      t.timestamps
    end
  end
end
