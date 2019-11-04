class Api::TeachersController < ApplicationController
  def index
    @teachers = Teacher.all
    render 'index.json.jb'
  end 

  def create
    @teacher = Teacher.new(
                          first_name: params[:first_name],
                          last_name: params[:last_name],
                          email: params[:email],
                          password: params[:password],
                          password_confirmation: params[:password_confirmation]
                          )

    if @teacher.save
      render 'show.json.jb'
    end
  end

  def show
    if params[:id] == "current"
      @teacher = current_user
    else
      @teacher = Teacher.find(params[:id])
    end
    
    render 'show.json.jb'
  end

  def update
    @teacher = Teacher.find(params[:id])
    @teacher.first_name = params[:first_name] || @teacher.first_name
    @teacher.last_name = params[:last_name] || @teacher.last_name
    @teacher.email = params[:email] || @teacher.email
    @teacher.password = params[:password] || @teacher.password

    if @teacher.save
      render 'show.json.jb'

    else 
      render json: {errors: @teacher.errors.full_messages}, status: :unprocessable_entity
    end 
  end

  def destroy
    teacher = Teacher.find(params[:id])
    teacher.destroy
    render 'index.json.jb'
  end
end

