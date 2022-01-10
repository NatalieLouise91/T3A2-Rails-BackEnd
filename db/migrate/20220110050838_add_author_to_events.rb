class AddAuthorToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :author, :string
  end
end
