class TaTestRequestsController < ApplicationController


  def index
    if params[:search]
      @ta_test_requests = TaTestRequest.search(params[:search])
    elsif params[:course_id]
      @course = Course.find(params[:course_id])
      @ta_test_requests = @course.ta_test_requests.all
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
    @course = Course.find(params[:course_id])
    @ta_test_request = @course.ta_test_requests.new

    respond_to do |format|
      format.html
      format.json { render json: [@course, @ta_test_request] }
    end
  end

  def create
    @course = Course.find(params[:course_id])
    @ta_test_request = @course.ta_test_requests.new(params[:ta_test_request])

    respond_to do |format|
      if @ta_test_request.save

	TaMailer.ta_request_email(@ta_test_request,"Team 32 MOOC" ,localhost:3000).deliver

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
    @course = @ta_test_request.course
    @ta_test_request.destroy

    respond_to do |format|
      format.html { redirect_to course_ta_test_requests_url(@course) }
      format.json { head :no_content }
    end
  end


end


