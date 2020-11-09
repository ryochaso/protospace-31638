class Prototype < ApplicationRecord
  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true
  validates :image, presence: true
  
  # def was_attched?
  #   self.image.attched?
  # end
  has_one_attached :image

  has_many :comments, dependent: :destroy
  belongs_to :user

end

