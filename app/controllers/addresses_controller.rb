class AddressesController < ApplicationController
    def create
	@address = Address.new(params[:address])
	@address.save
	puts "run here"
    	respond_to do |format|
            format.html { redirect_to root_path }
            format.js
	end
    end
   
    def New
	puts "@#####$#$%#%#$%#%$#%#$%$"
    end
end
