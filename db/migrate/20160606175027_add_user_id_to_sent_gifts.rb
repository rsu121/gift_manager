class AddUserIdToSentGifts < ActiveRecord::Migration
  def change
    add_column :sent_gifts, :user_id, :integer
  end
end
