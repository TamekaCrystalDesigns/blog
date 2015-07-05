class HomeController < ApplicationController
	
	def index

		@users = User.all

		def show
			@user = User.find_by_id(params[:id])
		end

	end

end