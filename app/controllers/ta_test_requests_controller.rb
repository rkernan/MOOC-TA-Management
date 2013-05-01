class TaTestRequestsController < ApplicationController



  def index
    if params[:search]
      @ta_test_requests = TaTestRequest.search(params[:search])
    elsif params[:test_result_id]
      @test_result = TestResult.find(params[:test_result_id])
      @ta_test_requests = @test_result.ta_test_requests.all
    else
      @ta_test_requests = TaTestRequest.all
    end

    respond_to do |format|
      format.html
      format.json { render json: @ta_test_requests }
    end
  end





  def show
    @ta_test_request = TaTestRequest.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @ta_test_request }
    end
  end


  def new

    @test_result = TestResult.find(params[:test_result_id]) 
    @ta_test_request = @test_result.ta_test_requests.new

    @course = @test_result.ta_test.course
    @professor = @course.professor
    TaMailer.ta_class_request_email(@professor.email, @course, @test_result.teaching_assistant.email,"MOOC TA Finder").deliver

    respond_to do |format|
      format.html
      format.json { render json: [@test_result,@ta_test_request] }
    end
  end



  def create

    @test_result = TestResult.find(params[:test_result_id]) 
    @ta_test_request = @test_result.ta_test_requests.new(params[:ta_test_request])

    @course = @test_result.ta_test.course
    @professor = @course.professor

    respond_to do |format|
      if @ta_test_request.save

        #TaMailer.ta_class_request_email(@professor.email, @course, @test_result.teaching_assistant.email, "MOOC TA Finder").deliver

        format.html { redirect_to @ta_test_request, notice: 'Test Request was sucessfully created.' }
        format.json { render json: @ta_test_request, status: :created, location: @ta_test_request }
      else
        format.html { render action: "new" }
        format.json { render json: @ta_test_request.errros, status: :unprocessable_entity }
      end
    end
  end




  def destroy
    @ta_test_request = TaTestRequest.find(params[:id])
    @test_result = @ta_test_request.test_result
    @ta_test_request.destroy

    respond_to do |format|
      format.html { redirect_to test_result_ta_test_requests_url(@test_result) }
      format.json { head :no_content }
    end
  end


end


