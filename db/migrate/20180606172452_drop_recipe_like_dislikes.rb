class DropRecipeLikeDislikes < ActiveRecord::Migration[5.1]
  def change
    drop_table :recipe_like_dislikes
  end
end
