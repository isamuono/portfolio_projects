class CreateGthreads < ActiveRecord::Migration[5.2]
  def change
    create_table :gthreads do |t|
      t.integer :role
      t.integer :user_id
      t.integer :channel_id
      t.integer :schedule_id
      t.string :title
      t.datetime :datetime
      t.string :place
      t.string :description

      t.timestamps
    end
  end
end
