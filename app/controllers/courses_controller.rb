class CoursesController < ApplicationController
  def index
    @professor = Professor.find(params[:professor_id])
    @courses = @professor.courses.all
    respond_to do |format|
      format.html
      format.json { render json: @courses }
    end
  end

  def show
    @professor = Professor.find(params[:professor_id])
    @course = Course.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @course }
    end
  end

  def new
    @professor = Professor.find(params[:professor_id])
    @course = Course.new
    respond_to do |format|
      format.html
      format.json { render json: @course }
    end
  end

  def create
    @professor = Professor.find(params[:professor_id])
    @course = @professor.courses.create(params[:course])
    redirect_to professor_courses_path
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    respond_to do |format|
      format.html { redirect_to professor_courses_url }
      format.json { head :no_content }
    end
  end
end
