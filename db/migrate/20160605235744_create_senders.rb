class CreateSenders < ActiveRecord::Migration
  def change
    create_table :senders do |t|
      t.integer :person_id
      t.integer :received_gift_id

      t.timestamps

    end
  end
end
