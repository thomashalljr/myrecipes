class DropRecipeLikesDislikes < ActiveRecord::Migration[5.1]
  def change
    drop_table :recipe_likes_dislikes
  end
end
