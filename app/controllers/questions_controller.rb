class QuestionsController < ApplicationController

  def create
    @ta_test = TaTest.find(params[:ta_test_id])
    @question = @ta_test.questions.create(params[:question])
    redirect_to professor_course_ta_test_path(@ta_test)
  end

end
