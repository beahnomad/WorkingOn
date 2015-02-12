class WorksController < ApplicationController

  before_action :validate_token
  rescue_from Fail::AccessDenied, with: :access_denied

  def index
    render json: Work.all
  end

  def create
    case params[:trigger_word]
    when 'on:'
      # TODO: Extract into single responsibility class
      if Work.create(user_name: params[:user_name], user_id: params[:user_id], text: params[:text])
        render json: { text: "Understood @#{params[:user_name]}! Work recorded!" }
      else
        render json: { text: "Hey @krule, there was a problem recording @#{params[:user_name]}'s work :panda_face:"}
      end
    when 'report!'
      render json: { text: "I am supposed to report happenings in last 24h but my maker was lazy and didn't finish me :panda_face:" }
    else
      render nothing: true, status: 202
    end
  end

  protected

  def validate_token
    fail(Fail::AccessDenied, 'token invalid') unless Rails.application.secrets.slack_token == params.delete(:token)
  end
end
