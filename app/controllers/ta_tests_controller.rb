class TaTestsController < ApplicationController

    def new
        @ta_test = TaTest.new
        respond_to do |format|
            format.html
            format.json { render json: @test }
        end
    end

    


end
