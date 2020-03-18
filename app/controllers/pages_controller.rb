class PagesController < ApplicationController

  def home
    redirect_to recipes_path if chef_signed_in?
  end

end
