class TaTestsController < ApplicationController
  # GET /ta_tests
  # GET /ta_tests.json
  def index
    @course = Course.find(params[:course_id])
    @ta_tests = @course.ta_tests.all

    respond_to do |format|
      format.html
      format.json { render json: @ta_tests }
    end
  end

  # GET /ta_tests/1
  # GET /ta_tests/1.json
  def show
    @ta_test = TaTest.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @ta_test }
    end
  end

  # GET /ta_tests/new
  # GET /ta_tests/new.json
  def new
    @course = Course.find(params[:course_id])
    @ta_test = @course.ta_tests.new
    3.times do
      question = @ta_test.questions.build
      4.times do
        question.answers.build
      end
    end

    respond_to do |format|
      format.html
      format.json { render json: [@course, @ta_test] }
    end
  end

  # GET /ta_tests/1/edit
  # GET /ta_tests/1/edit.json
  def edit
    @ta_test = TaTest.find(params[:id])
  end

  # POST /ta_tests
  # POST /ta_tests.json
  def create
    @course = Course.find(params[:course_id])
    @ta_test = @course.ta_tests.new(params[:ta_test])

    respond_to do |format|
      if @ta_test.save
        format.html { redirect_to @ta_test, notice: 'Test was successfully created.' }
        format.json { render json: @ta_test, status: :created, location: @ta_test }
      else
        format.html { render action: "new" }
        format.json { render json: @ta_test.errros, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ta_tests/1
  # PUT /ta_tests/1.json
  def update
    @ta_test = TaTest.find(params[:id])

    respond_to do |format|
      if @ta_test.update_attributes(params[:ta_test])
        format.html { redirect_to @ta_test, notice: 'Test was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ta_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ta_tests/1
  # DELETE /ta_tests/1.json
  def destroy
    @ta_test = TaTest.find(params[:id])
    @course = @ta_test.course
    @ta_test.destroy

    respond_to do |format|
      format.html { redirect_to course_ta_tests_url(@course) }
      format.json { head :no_content }
    end
  end

  def take
    @ta_test = TaTest.find(params[:ta_test_id])
    @test_result = @ta_test.test_results.new

    respond_to do |format|
      format.html
      format.json { render json: [@ta_test, @test_result] }
    end

  end

end
