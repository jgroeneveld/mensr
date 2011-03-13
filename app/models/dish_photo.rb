# == Schema Information
# Schema version: 20110313125216
#
# Table name: dish_photos
#
#  id                   :integer         not null, primary key
#  dish_id              :integer
#  picture_file_name    :string(255)
#  picture_content_type :string(255)
#  picture_file_size    :integer
#  picture_updated_at   :datetime
#  created_at           :datetime
#  updated_at           :datetime
#  user_id              :integer
#

class DishPhoto < ActiveRecord::Base
  belongs_to :dish
  belongs_to :uploader, class_name: 'User'
  has_attached_file :picture, styles: {
    large: "640x480>",
    middle: "200x150>",
    thumb: "50x38#"
  }

  # validations von http://stackoverflow.com/questions/2257041/smarter-paperclip-validations
  validates_attachment_presence :picture
  validates_attachment_size :picture, less_than: 1.megabyte
  validates_attachment_content_type :picture, content_type: ['image/jpeg', 'image/pjpeg','image/png', 'image/x-png', 'image/gif']
end
