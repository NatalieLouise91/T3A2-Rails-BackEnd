class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :date
      t.integer :attendees
      t.string :location
      t.string :time
      t.string :contact_name
      t.integer :contact_phone

      t.timestamps
    end
  end
end
