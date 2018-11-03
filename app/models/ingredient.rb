class Ingredient < ApplicationRecord
  before_validation :to_lower
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates_uniqueness_of :name
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  private

  def to_lower
    self.name = self.name.downcase
  end
end
