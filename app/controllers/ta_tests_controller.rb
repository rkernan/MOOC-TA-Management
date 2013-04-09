class TaTestsController < ApplicationController

  def new
    @professor = Professor.find(params[:professor_id])
    @course = Course.find(params[:course_id])
    @ta_test = TaTest.new
    3.times do
      question = @ta_test.questions.build
      4.times do
        question.answers.build
      end
    end
    respond_to do |format|
      format.html
      format.json { render json: @ta_test }
    end
  end

  def create
    @course = Course.find(params[:course_id])
    @ta_test = @course.ta_tests.create(params[:ta_test])
    redirect_to professor_course_ta_tests_path
  end

  def show
    @professor = Professor.find(params[:professor_id])
    @course = Course.find(params[:course_id])
    @ta_test = TaTest.find(params[:id]) 
    respond_to do |format|
      format.html  # show.html.erb
      format.json  { render :json => @ta_test }
    end
  end
    
  def index
    @professor = Professor.find(params[:professor_id])
    @course = Course.find(params[:course_id])
    @ta_tests = @course.ta_tests.all
    respond_to do |format|
      format.html
      format.json { render json: @ta_tests }
    end
  end

  def destroy
    @ta_test = TaTest.find(params[:id])
    @ta_test.destroy
    respond_to do |format|
      format.html { redirect_to ta_tests_url }
      format.json { head :no_content }
    end
  end

  def take
    @ta_test = TaTest.find(params[:id])
  end

end
