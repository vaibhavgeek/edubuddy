class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.integer :user_id
      t.string :content
      t.string :image_id

      t.timestamps null: false
    end
  end
end
