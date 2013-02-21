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
        format.html { redirect_to @ta_test, notice: 'TA_Test was successfully created.' }
        format.json { render json: @ta_test, status: created, location: @ta_test }
      else
        format.html { render action: 'new' }
        format.json { render json: @ta_test.errors, status: :unprocessable_entity }
      end
    end
  end
    
  def index
    @ta_tests = TaTest.all
    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
  end


end
