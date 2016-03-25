class DosesController < ApplicationController

	before_action :find_cocktail, only: [:new, :create]

    def new
    	@dose = Dose.new
    end
    def create
    	
    	@dose = @cocktail.doses.new(params_dose)
    	@dose.save

    	redirect_to cocktail_path(@cocktail)
    end

    def destroy
    	@dose = Dose.find(params[:id])
    	@dose.destroy
    	redirect_to root_path
    end

private

def params_dose
    params.require(:dose).permit(:description, :ingredient_id)
end

def find_cocktail

	@cocktail = Cocktail.find(params[:cocktail_id])
end






end
