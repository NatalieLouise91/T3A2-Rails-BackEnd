class CreateRosteredTms < ActiveRecord::Migration[6.1]
  def change
    create_table :rostered_tms do |t|
      t.string :first_name
      t.string :last_name
      t.references :roster, null: false, foreign_key: true

      t.timestamps
    end
  end
end
