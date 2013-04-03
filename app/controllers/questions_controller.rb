class QuestionsController < ApplicationController

  def create
    @professor = Professor.find(params[:professor_id])
    @course = Course.find(params[:course_id])
    @ta_test = TaTest.find(params[:ta_test_id])
    @question = @ta_test.questions.create(params[:question])
    redirect_to professor_course_ta_test_path(@professor, @course, @ta_test)
  end

end
