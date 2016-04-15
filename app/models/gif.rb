class Gif < ActiveRecord::Base
  belongs_to :category
  validates_presence_of :image_path
end
