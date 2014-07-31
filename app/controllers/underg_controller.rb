class UndergController < ApplicationController
	def index()
		@message = "test"
		render :layout => !pjax?
	end
	
	def aboutUs()
		render :layout => !pjax?
	end
	
	def account()
		render :layout => !pjax?
	end
	
	private
	def pjax?
		env['HTTP_X_PJAX']
    end
end
