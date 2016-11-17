class DosesController < ApplicationController

  before_action :current_cocktail, only: [:new, :create]

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    @ingredient = Ingredient.find(params[:dose][:ingredient].to_i)
    @dose.ingredient = @ingredient
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy

  end

  private

  def current_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description ,:ingredient_id, :cocktail_id)
  end
end
