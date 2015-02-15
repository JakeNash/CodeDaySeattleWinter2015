class Floorplan < ActiveRecord::Base
  belongs_to :listing
  has_attached_file :photo, :styles => {:medium => "750x500>", :thumb => "130x100>" }, :default_url => "AnnaFisherAstronaut.jpg"
  validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end