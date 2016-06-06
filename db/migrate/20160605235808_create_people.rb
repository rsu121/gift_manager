class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :phonenumber
      t.text :address
      t.date :birthday
      t.string :name

      t.timestamps

    end
  end
end
