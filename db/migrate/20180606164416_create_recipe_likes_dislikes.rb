class CreateRecipeLikesDislikes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipe_likes_dislikes do |t|
      t.integer :recipe_id
      t.integer :chef_id
      t.boolean :does_like, default: true
    end
  end
end
