class TestResultsController < ApplicationController

  # GET /test_results
  # GET /test_results.json
  def index
    @ta_test = TaTest.find(params[:ta_test_id])
    @test_results = @ta_test.test_results.all

    respond_to do |format|
      format.html
      format.json { render json: @test_results }
    end
  end

  # GET /test_results/new
  # GET /test_results/new.json
  def new
    @ta_test = TaTest.find(params[:ta_test_id])
    @ta = TeachingAssistant.find(current_user.id)
    @test_result = @ta_test.test_results.new(:teaching_assistant => @ta)

    @ta_test.questions.each do |question|
      question_result = @test_result.question_results.build
      question_result.question = question
      question.answers.each do |answer|
        answer_result = question_result.answer_results.build
        answer_result.answer = answer
      end
    end

    respond_to do |format|
      format.html
      format.json { render json: [@ta_test, @test_result] }
    end
  end

  # POST /test_results
  # POST /test_results.json
  def create
    @ta_test = TaTest.find(params[:ta_test_id])
    @test_result = @ta_test.test_results.new(params[:test_result])

    respond_to do |format|
      if @test_result.save
        format.html { redirect_to @test_result, notice: 'Test was successfully taken.' }
        format.json { render json: @test_result, status: :created, location: @test_result }
      else
        format.html { render action: "new" }
        format.json { render json: @test_result.errors, status: :unprocessable_entity }
      end
    end
  end

end
