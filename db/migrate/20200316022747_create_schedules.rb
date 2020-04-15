class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.integer :role
      t.integer :user_id
      t.integer :community_id
      t.integer :thread_id
      t.string :title
      t.integer :datetime
      t.integer :channel_id
      t.string :place
      t.string :note

      t.timestamps
    end
  end
end
