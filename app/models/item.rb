class Item < ApplicationRecord
  belongs_to :category
  belongs_to :user
  validates :name, presence: true
  validates_associated :images
  validates :images, presence: true
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
end
