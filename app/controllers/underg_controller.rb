class UndergController < ApplicationController
	def inde123()
    2
		@message = "test"
		render :layout => !pjax?
	end

	def aboutUs()
		render :layout => !pjax?
	end

	def account()
		render :layout => !pjax?
  end
end
