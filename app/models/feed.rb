class Feed < ActiveRecord::Base	

belongs_to :user 
belongs_to :channel 
  has_attached_file :image, styles: { medium: "400x400>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
