class WorksController < ApplicationController
  def index
    render json: Work.all
  end

  def create
    case params[:trigger_word]
    when 'on:'
      if Work.create(user_name: params[:user_name], user_id: params[:user_id], text: params[:text])
        render json: { text: "Understood, @#{params[:user_name]} work recorded!" }
      else
        render json: { text: "Hey @krule, there was a problem recording @#{params[:user_name]}'s work :panda_face:"}
      end
    else
      render nothing: true, status: 202
    end
  end
end
