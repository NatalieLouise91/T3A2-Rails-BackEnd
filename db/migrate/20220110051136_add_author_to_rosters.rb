class AddAuthorToRosters < ActiveRecord::Migration[6.1]
  def change
    add_column :rosters, :author, :string
  end
end
