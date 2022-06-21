class UsersController < ApplicationController
	def index
		@q = User.ransack(params[:q])
		@users = @q.result(distinct: true) 
		# @users = User.all.order(created_at: :desc)
	end
end