class Api::ParticipationsController < ApplicationController
  def index
    @participations = Participation.all
    render 'index.json.jb'
  end 

  def create
    @participation = Participation.new(
                          course_id: params[:course_id],
                          student_id: params[:student_id]
                          )

    if @participation.save
      render 'show.json.jb'
    end
  end

  def show
    @participation = Participation.find(params[:id])
    render 'show.json.jb'
  end

  def update
    @participation = Participation.find(params[:id])
    @participation.course_id = params[:course_id] || @participation.course_id
    @participation.student_id = params[:student_id] || @participation.student_id

    if @participation.save
      render 'show.json.jb'

    else 
      render json: {errors: @participation.errors.full_messages}, status: :unprocessable_entity
    end 
  end

  def destroy
    participation = Participation.find(params[:id])
    participation.destroy
    render 'index.json.jb'
  end
end
