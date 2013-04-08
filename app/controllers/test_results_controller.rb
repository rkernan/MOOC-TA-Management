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

end
