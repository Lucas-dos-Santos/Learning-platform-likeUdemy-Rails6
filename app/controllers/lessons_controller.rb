class LessonsController < ApplicationController
  before_action :set_lesson, only: %i[ show edit update destroy ]

  def index
    @lessons = Lesson.includes(:course).all
  end

  def show
    @title_head = @lesson.title
  end

  def new
    @lesson = Lesson.new
    @course = Course.friendly.find(params[:course_id])
  end

  def edit
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @course = Course.friendly.find(params[:course_id])
    respond_to do |format|
      if @lesson.save
        format.html { redirect_to course_lesson_path(@lesson.course, @lesson), notice: "Lesson was successfully created." }
        format.json { render :show, status: :created, location: @lesson }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @lesson.update(lesson_params)
        format.html { redirect_to [@lesson.course, @lesson], notice: "Lesson was successfully updated." }
        format.json { render :show, status: :ok, location: @lesson }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @lesson.destroy

    respond_to do |format|
      format.html { redirect_to @course, notice: "Lesson was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_lesson
      @lesson = Lesson.includes(:course).friendly.find(params[:id])
      @course = @lesson.course
      authorize @lesson
    end

    def lesson_params
      params.require(:lesson).permit(:title, :content, :course_id)
    end
end
