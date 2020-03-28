class PagesController < ApplicationController

  def home
    redirect_to recipes_path if chef_signed_in?
  end

  def search
    @search_term = params[:q]
    @recipes     = Recipe.ransack(name_cont: params[:q]).result(distinct: true)
    @ingredients = Ingredient.ransack(name_cont: params[:q]).result(distinct: true)

    respond_to do |format|
      format.html {}
      format.json {
        @recipes     = @recipes.limit(5)
        @ingredients = @ingredients.limit(5)
      }
    end
  end

end
