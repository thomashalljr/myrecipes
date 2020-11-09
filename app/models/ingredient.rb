class Ingredient < ApplicationRecord
  before_validation :lowercase

  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates_uniqueness_of :name

  private

    def lowercase
      self.name = self.name.downcase
    end
end
