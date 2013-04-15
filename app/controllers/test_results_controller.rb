class TestResultsController < ApplicationController

  def create
    @ta_test = TaTest.find(params[:ta_test_id])
    @ta = TeachingAssistant.find(params[:teaching_assistant_id])
    @result = @ta_test.test_results.create(params[:test_result])
    @result = @ta.test_results.update(params[:test_result])
    redirect_to teaching_assistant_test_result_path(@result)
  end

  def index
    @ta_test = TaTest.find(params[:ta_test_id])
   # @ta = TeachingAssistant.find(params[:teaching_assistant_id])
    @test_results = @ta_test.test_results.all
    respond_to do |format|
      format.html
      format.json { render json: @test_results }
    end
  end

  def new
    @ta_test = TaTest.find(params[:ta_test_id])
    @ta = TeachingAssistant.find(current_user.id)
    @test_result = @ta_test.test_results.new

    #@ta_test.questions.each do |question|
    #  question_result = @test_result.question_results.build
    #  question.answers.each do
    #    question_result.answer_results.build
    #  end
    #end


    respond_to do |format|
      format.html
      format.json { render json: [@ta_test, @test_result] }
    end
  end


end
