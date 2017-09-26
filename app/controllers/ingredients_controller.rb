class IngredientsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = Ingredient.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe.ingredients.create(ingredient_params)
  end

  def edit
  end

  def index
  end


  def show
  end
end
