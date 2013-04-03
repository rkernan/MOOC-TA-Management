class TestResultsController < ApplicationController

  def index
    @test_results = TestResult.all
    respond_to do |format|
      format.html
      format.json { render json: @test_results }
  end


end
