class RemoveItFromFeeds < ActiveRecord::Migration
  def change
  	remove_column :feeds, :image_id 
  end
end
