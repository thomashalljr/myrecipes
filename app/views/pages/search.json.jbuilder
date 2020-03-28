json.recipes do
  json.array!(@recipes) do |recipe|
    json.name recipe.name
    json.url recipe_path(recipe)
  end
end

json.ingredients do
  json.array!(@ingredients) do |ingredient|
    json.name ingredient.name
    json.url ingredient_path(ingredient)
  end
end
