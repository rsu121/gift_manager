class AddImageUrlToSentGifts < ActiveRecord::Migration
  def change
    add_column :sent_gifts, :image_url, :string
  end
end
