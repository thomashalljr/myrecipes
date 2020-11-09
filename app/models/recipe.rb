class Recipe < ApplicationRecord
  belongs_to :chef
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  accepts_nested_attributes_for :recipe_ingredients, allow_destroy: true

  validates :name, presence: true
  validates :description, presence: true, length: {minimum: 5}
  validates :chef_id, presence: true

  mount_uploader :image, ImageUploader

  default_scope -> { order(updated_at: :desc) }

  def thumbs_up_total
    self.likes.where(like: true).size
  end

  def thumbs_down_total
    self.likes.where(like: false).size
  end
end
