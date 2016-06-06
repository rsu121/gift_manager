class CreateRecipients < ActiveRecord::Migration
  def change
    create_table :recipients do |t|
      t.integer :person_id
      t.integer :sent_gift_id

      t.timestamps

    end
  end
end
