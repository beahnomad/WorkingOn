class ApplicationController < ActionController::API
  protected

  def access_denied
    render json: { error: 'Access denied!' }, status: 401
  end
end
