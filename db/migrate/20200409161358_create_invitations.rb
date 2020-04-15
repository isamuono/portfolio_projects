class CreateInvitations < ActiveRecord::Migration[5.2]
  def change
    create_table :invitations do |t|
      t.string  :family_name
      t.string  :first_name
      t.string  :email
      t.integer :user_id

      t.timestamps
    end
  end
end
