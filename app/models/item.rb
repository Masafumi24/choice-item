class Item < ApplicationRecord
  belongs_to :category
  belongs_to :user
  validates :name, presence: true
  validates_associated :images
  validates :images, presence: true
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  scope :newturn,  -> {order(id: "DESC")}
  scope :random_order, -> {order("RAND()")}

  scope :limit_1, -> {limit(1)}
  scope :limit_10, -> {limit(10)}

  scope :new_chart_10, -> {newturn.limit_10}
  scope :random_choice, -> {random_order.limit_1}

  scope :includes_images, -> {includes(:images)}
  scope :includes_images_user, -> {includes(:images, :user)}

  def self.search(search)
    if search
      Item.where('name LIKE(?) OR brand LIKE(?) OR status LIKE(?)', "%#{search}%", "%#{search}%", "%#{search}%")
    else
      Item.all
    end
  end

end
