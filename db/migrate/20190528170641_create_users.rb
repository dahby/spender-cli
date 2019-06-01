class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.integer :pin
      t.integer :zip_code

      t.timestamps
    end
  end
end
