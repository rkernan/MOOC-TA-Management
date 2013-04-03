class TaTestsController < ApplicationController

  def new
    @ta_test = TaTest.new
    respond_to do |format|
      format.html
      format.json { render json: @ta_test }
    end
  end

  def create
    @ta_test = TaTest.new(params[:ta_test])
    respond_to do |format|
      if @ta_test.save
        format.html { redirect_to(@ta_test, notice: 'TA_Test was successfully created.') }
        format.json { render json: @ta_test, status: created, location: @ta_test }
      else
        format.html { render action: 'new' }
        format.json { render json: @ta_test.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
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
