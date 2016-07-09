class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.string :content
      t.integer :feed_id
      t.integer :user_id
      t.string :image_id

      t.timestamps null: false
    end
  end
end
