class AddChannelToFeed < ActiveRecord::Migration
  def change
   add_column :feeds , :channel_id , :integer
  end
end
