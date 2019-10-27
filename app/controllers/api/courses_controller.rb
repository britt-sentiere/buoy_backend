class Api::CoursesController < ApplicationController
  def index
    @courses = Course.all
    render 'index.json.jb'
  end 

  def create
    @course = Course.new(

                          course_name: params[:course_name],
                          teacher_id: params[:teacher_id]
                
                          )

    if @course.save
      render 'show.json.jb'
  end

  def show
    @course = Course.find(params[:id])
    render 'show.json.jb'
  end

  def update
    @course = Course.find(params[:id])
    @course.course_name = params[:course_name] || @course.course_name
    @course.teacher_id = params[:teacher_id] || @course.teacher_id

    if @course.save
      render 'show.json.jb'

    else 
      render json: {errors: @course.errors.full_messages}, status: :unprocessable_entity
    end 
  end

  def destroy
    course = Course.find(params[:id])
    course.destroy
    render 'index.json.jb'
  end
end
