class RecipesController < ApplicationController
  def index
    @recipes = Recipe.page(params[:page]).per(10)
  end

  def new
    @recipe = Recipe.new
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def destroy
    @recipe = Recipe.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to recipes_path }
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to 'show'
    else
      render 'new'
    end
  end
end
