class Tagging < ApplicationRecord
  belongs_to :tagging
  belongs_to :word
  validates :word_id, presence:true
  validates :tag_id, presence:true
end
