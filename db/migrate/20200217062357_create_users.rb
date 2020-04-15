class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.integer :role
      t.string  :family_name
      t.string  :first_name
      t.string  :accountName
      t.string  :email
      t.string  :image
      t.string  :description

      t.timestamps
    end
  end
end
