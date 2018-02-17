class Tag < ApplicationRecord
  validates :tag_name,presence:true,length:{maximum:40}
  has_and_belongs_to_many :words
end
