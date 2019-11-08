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

      participation_for_actioncable = {
        id: @help_request.participation.id,
        course: {
          id: @help_request.participation.course.id,
          course_name: @help_request.participation.course.course_name,
          teacher: {
            id: @help_request.participation.course.teacher.id,
            first_name: @help_request.participation.course.teacher.first_name,
            last_name: @help_request.participation.course.teacher.last_name,
            email: @help_request.participation.course.teacher.email
          }
        },
        student: {
          id: @help_request.participation.student.id,
          first_name: @help_request.participation.student.first_name,
          last_name: @help_request.participation.student.last_name,
          email: @help_request.participation.student.email,
          help_request_counts: @help_request.participation.student.help_requests.count,
          open_help_request: @help_request.participation.student.open_help_request && {
            id: @help_request.participation.student.open_help_request.id,
            participation_id: @help_request.participation.student.open_help_request.participation_id,
            created_at: @help_request.participation.student.open_help_request.created_at,
            completed_time: @help_request.participation.student.open_help_request.completed_time,
            formatted: {
              created_at: @help_request.participation.student.open_help_request.formatted_created_at
            }
          }
        },
        help_requests: @help_request.participation.help_requests.order(:id).map { |help_request| 
          {
            id: help_request.id,
            participation_id: help_request.participation_id,
            created_at: help_request.created_at,
            completed_time: help_request.completed_time,
            formatted: {
              created_at: help_request.formatted_created_at
            }
          }
        }
      }

     ActionCable.server.broadcast "help_requests_channel", participation_for_actioncable

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

    help_requests_for_actioncable = help_request.student.help_requests.map {|help_request_obj|
      {
        id: help_request_obj.id,
        completed_time: help_request_obj.completed_time,
        participation_id: help_request_obj.participation_id,
        created_at: help_request_obj.created_at,
        formatted: {
          created_at: help_request_obj.formatted_created_at
        }
      }
    }


    ActionCable.server.broadcast "students_channel", help_requests_for_actioncable

    render 'api/courses/show.json.jb'
  end

  def destroy
    help_request = HelpRequest.find(params[:id])
    help_request.destroy
    render 'index.json.jb'
  end
end
