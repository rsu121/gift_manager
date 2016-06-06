class CreateSentGifts < ActiveRecord::Migration
  def change
    create_table :sent_gifts do |t|
      t.text :content
      t.text :purpose
      t.date :date

      t.timestamps

    end
  end
end
