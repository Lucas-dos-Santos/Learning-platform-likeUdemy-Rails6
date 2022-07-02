class ApplicationController < ActionController::Base
  include Pundit::Authorization
  include Pagy::Backend
	before_action :authenticate_user!
	before_action :set_global_variables

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_back(fallback_location: root_path)
  end

  def set_global_variables
    @filter_courses = Course.ransack(params[:courses_search], search_key: :courses_search)
  end
end
