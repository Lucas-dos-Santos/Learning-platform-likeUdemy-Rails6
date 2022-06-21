class CoursesController < ApplicationController
  before_action :set_course, only: %i[ show edit update destroy ]
  before_action :set_i18n_levels, :set_i18n_languages, except: [:destroy]

  def index
    if params[:title]
      @courses = Course.where('title ILIKE ?', "%#{params[:title]}%")
    else
      if params[:q]
        @language_selected = params[:q][:language_eq]
        @level_selected = params[:q][:level_eq]
        params[:q][:level_eq] = Course.levels[params[:q][:level_eq]]
        params[:q][:language_eq] = Course.languages[params[:q][:language_eq]]
      end
      @q = Course.ransack(params[:q])
      @courses = @q.result(distinct: true) 
    end
  end

  def show
  end

  def new
    @course = Course.new
  end

  def edit
  end

  def create
    @course = Course.new(course_params)
    @course.user = current_user

    respond_to do |format|
      if @course.save
        format.html { redirect_to course_url(@course), notice: "Course was successfully created." }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to course_url(@course), notice: "Course was successfully updated." }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @course.destroy

    respond_to do |format|
      format.html { redirect_to courses_url, notice: "Course was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_course
      @course = Course.friendly.find(params[:id])
    end

    def course_params
      params.require(:course).permit(:title, :description, :short_description, :language, :level, :price)
    end

    def set_i18n_levels
      @levels = I18n.t('activerecord.attributes.course.levels')
    end

    def set_i18n_languages
      @languages = I18n.t('activerecord.attributes.course.languages')
    end
end
