class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = Ingredient.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.create(ingredient_params)

    respond_to do |format|
      if @ingredient.save(ingredient_params)
        format.html { redirect_to recipe_path(@recipe) }
        format.json { render :show, status: :created, title: @ingredient }
      else
        format.html { render :new }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.find(params[:id])

    respond_to do |format|
      if @ingredient.update(ingredient_params)
        format.html { redirect_to recipe_path(@recipe), notice: 'Ingredient was successfully updated.' }
        format.json { render :show, status: :ok, title: @ingredient }
      else
        format.html { render :edit }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.find(params[:id])

    @ingredient.destroy

    respond_to do |format|
      format.html { redirect_to recipe_path(@recipe), notice: 'Ingredient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def edit
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.find(params[:id])
  end

  private

  def set_ingredient
    @recipe = Recipe.find(params[:recipe_id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:count, :name)
  end

end
