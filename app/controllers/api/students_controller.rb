class Api::StudentsController < ApplicationController

  def index
    @students = Student.all
    render 'index.json.jb'
  end

  def create
    @student = Student.new(
                          first_name: params[:first_name],
                          last_name: params[:last_name],
                          email: params[:email],
                          password: params[:password],
                          password_confirmation: params[:password_confirmation]
                          )

    if @student.save
      render 'show.json.jb'
    end
  end 

  def show
    @student = Student.find(params[:id])
    render 'show.json.jb'
  end

  def update
    @student = Student.find(params[:id])
    @student.first_name = params[:first_name] || @student.first_name
    @student.last_name = params[:last_name] || @student.last_name
    @student.email = params[:email] || @student.email
    @student.password = params[:password] || @student.password

    if @student.save
      render 'show.json.jb'

    else 
      render json: {errors: @student.errors.full_messages}, status: :unprocessable_entity
    end 
  end

  def destroy
    student = Student.find(params[:id])
    student.destroy
    render json: {message: "Successfully Removed Student"}
  end

end