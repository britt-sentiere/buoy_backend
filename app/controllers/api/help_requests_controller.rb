class Api::HelpRequestsController < ApplicationController
  def index
    @help_requests = HelpRequest.all
    render 'index.json.jb'
  end 

  def create
    @help_request = HelpRequest.find_or_create_by(
                          participation_id: params[:participation_id],
                          completed_time: nil
                          )

    puts "*" * 50
    p @help_request
    puts "*" * 50

    # ** ActionCable server info
    # recreate hash from _participation

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

  def complete
    help_request = HelpRequest.find(params[:id])
    help_request.update(completed_time: Time.now)
    @course = help_request.course

    render 'api/courses/show.json.jb'
  end

  def destroy
    help_request = HelpRequest.find(params[:id])
    help_request.destroy
    render 'index.json.jb'
  end
end
