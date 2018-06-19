class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5 }
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_many :pictures, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :pictures, allow_destroy: true 
  resourcify
end
