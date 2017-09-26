class StepsController < ApplicationController
  before_action :set_step, only: [:show, :edit, :update, :destroy]

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @step = Step.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @step = @recipe.steps.build(step_params)

    respond_to do |format|
      if @step.save(step_params)
        format.html { redirect_to recipe_path(@recipe) }
        format.json { render :show, status: :created, title: @step }
      else
        format.html { render :new }
        format.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @recipe = Recipe.find(params[:recipe_id])
    @step = @recipe.steps.find(params[:id])

    respond_to do |format|
      if @step.update(step_params)
        format.html { redirect_to @recipe, notice: 'Step was successfully updated.' }
        format.json { render :show, status: :ok, title: @step }
      else
        format.html { render :edit }
        format.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @step = @recipe.steps.find(params[:id])

    @step.destroy
    respond_to do |format|
      format.html { redirect_to recipe_path(@recipe), notice: 'Step was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def edit
    @recipe = Recipe.find(params[:recipe_id])
    @step = @recipe.steps.find(params[:id])
  end

  private

  def set_step
    @recipe = Recipe.find(params[:recipe_id])
  end

  def step_params
    params.require(:step).permit(:description)
  end
end
