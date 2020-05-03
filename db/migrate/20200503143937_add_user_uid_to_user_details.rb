class AddUserUidToUserDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :user_details, :user_uid, :string
  end
end
