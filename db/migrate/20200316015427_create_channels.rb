class CreateChannels < ActiveRecord::Migration[5.2]
  def change
    create_table :channels do |t|
      t.integer :user_id
      t.integer :community_id
      t.string :title
      t.string :description
      t.integer :public

      t.timestamps
    end
  end
end
