class AddImageUrlToReceivedGifts < ActiveRecord::Migration
  def change
    add_column :received_gifts, :image_url, :string
  end
end
