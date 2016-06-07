class AddUserIdToSender < ActiveRecord::Migration
  def change
    add_column :senders, :user_id, :integer
  end
end
