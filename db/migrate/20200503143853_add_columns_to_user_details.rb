class AddColumnsToUserDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :user_details, :name, :string
    add_column :user_details, :score, :integer, default: 0
  end
end
