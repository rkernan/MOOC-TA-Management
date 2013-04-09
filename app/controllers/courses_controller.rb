class CoursesController < ApplicationController
  # GET /courses
  # GET /courses.json
  def index
      @courseSearch = Course.search(params[:search])
    if params[:professor_id]
      @professor = Professor.find(params[:professor_id])
      @courses = @professor.courses.all
    else
      @courses = Course.all
    end

    respond_to do |format|
      format.html
      format.json { render json: @courses }
    end
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @course = Course.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @course }
    end
  end

  # GET /courses/new
  # GET /courses/new.json
  def new
    @professor = Professor.find(params[:professor_id])
    @course = @professor.courses.new

    respond_to do |format|
      format.html
      format.json { render json: [@professor, @course] }
    end
  end

  # GET /courses/1/edit
  def edit
    @course = Course.find(params[:id])
  end

  # POST /courses
  # POST /courses.json
  def create
    @professor = Professor.find(params[:professor_id])
    @course = @professor.courses.new(params[:course])

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render json: @course, status: :create, location: @course }
      else
        format.html { render action: "new" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /courses/1
  # PUT /courses/1.json
  def update
    @course = Course.find(params[:id])

    respond_to do |format|
      if @course.update_attributes(params[:course])
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course = Course.find(params[:id])
    @professor = @course.professor
    @course.destroy

    respond_to do |format|
      format.html { redirect_to professor_courses_url(@professor) }
      format.json { head :no_content }
    end
  end
end
