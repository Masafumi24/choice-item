class Item < ApplicationRecord
  validates :name, presence: true
  validates_associated :images
  validates :images, presence: true
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
  belongs_to :category
end
