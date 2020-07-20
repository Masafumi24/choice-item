class Item < ApplicationRecord
  belongs_to :category
  belongs_to :user
  validates :name, presence: true
  validates_associated :images
  validates :images, presence: true
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  scope :newturn,  -> {order(id: "DESC")}
  scope :random_order, -> {order(Arel.sql("RAND()"))}

  scope :limit_1, -> {limit(1)}
  scope :limit_10, -> {limit(10)}

  scope :new_chart_10, -> {newturn.limit_10}
  scope :random_choice, -> {random_order.limit_1}

  scope :includes_images, -> {includes(:images)}

  def self.index_new_10_get
    Item.includes(:images, :user).order(id: "DESC").limit(10)
  end

  def self.user_items_get(user_bigint)
    Item.includes(:images).where(user_id:(user_bigint)).order(id: "DESC")
  end

  def self.all_get
    Item.includes(:images).all.order(id: "DESC")
  end

  def self.search(search)
    if search
      Item.where('name LIKE(?) OR brand LIKE(?) OR status LIKE(?)', "%#{search}%", "%#{search}%", "%#{search}%").order(id: "DESC")
    else
      Item.all
    end
  end

  

end
