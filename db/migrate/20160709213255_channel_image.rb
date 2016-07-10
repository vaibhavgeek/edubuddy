class ChannelImage < ActiveRecord::Migration
  def change
  	remove_column :channels, :image_id
  end
end
