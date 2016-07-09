class AddScoreToFeed < ActiveRecord::Migration
  def change
  add_column :feeds , :score , :float
  end
end
