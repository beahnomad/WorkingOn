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
      if Work.create(work_params)
        render json: { text: RandomResponder::Good.respond(params[:user_name]) }
      else
        render json: { text: RandomResponder::Bad.respond(params[:user_name]) }
      end
    when 'report!'
      render json: { text: RandomResponder::Lazy.respond(params[:user_name]) }
    else
      render nothing: true, status: 202
    end
  end

  protected

  def work_params
    {
      user_name: params[:user_name],
      user_id: params[:user_id],
      text: params[:text][3..-1].strip
    }
  end

  def validate_token
    fail(Fail::AccessDenied, 'token invalid') unless Rails.application.secrets.slack_token == params.delete(:token)
  end
end
