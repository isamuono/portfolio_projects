class CreateCommunities < ActiveRecord::Migration[5.2]
  def change
    create_table :communities do |t|
      t.string  :communityName
      t.string  :category
      t.string  :subcategory
      t.string  :prefecture
      t.string  :sex
      t.string  :scale
      t.string  :image
      t.string  :description
      t.integer :user_id
      t.integer :public

      t.timestamps
    end
  end
end
