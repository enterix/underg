class UndergController < ApplicationController
	def index()
		@message = "test"
		render :layout => !pjax?
	end

	def aboutUs()
		render :layout => !pjax?
	end
end
