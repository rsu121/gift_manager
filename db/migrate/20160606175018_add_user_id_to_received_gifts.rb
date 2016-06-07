class AddUserIdToReceivedGifts < ActiveRecord::Migration
  def change
    add_column :received_gifts, :user_id, :integer
  end
end
