class TestResultsController < ApplicationController

  def index
    @test_results = TestResult.all
    respond_to do |format|
      format.html
      format.json { render json: @test_results }
  end

  #def create
   # @test_results = TestResult.find(params[:ta_test_id])
   # @question = @ta_test.questions.create(params[:question])
   # redirect_to ta_test_path(@ta_test)
  #end

end
