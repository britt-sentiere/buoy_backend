class Api::HelpRequestsController < ApplicationController
  def index
    @help_requests = HelpRequest.all
    render 'index.json.jb'
  end 

  def create
    @help_request = HelpRequest.new(
                          participation_id: params[:participation_id],
                          completed_time: params[:completed_time]
                          )

    if @help_request.save
      render 'show.json.jb'
  end

  def show
    @help_request = HelpRequest.find(params[:id])
    render 'show.json.jb'
  end

  def update
    @help_request = HelpRequest.find(params[:id])
    @help_request.participation_id = params[:participation_id] || @help_request.participation_id
    @help_request.completed_time = params[:completed_time] || @help_request.completed_time

    if @help_request.save
      render 'show.json.jb'

    else 
      render json: {errors: @help_request.errors.full_messages}, status: :unprocessable_entity
    end 
  end

  def destroy
    help_request = HelpRequest.find(params[:id])
    help_request.destroy
    render 'index.json.jb'
  end
end
