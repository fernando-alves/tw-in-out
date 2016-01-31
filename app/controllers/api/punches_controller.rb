class Api::PunchesController < ActionController::Base
  respond_to :json
  def index
    if authenticate_with_http_token { |api_token, options| User.find_by_api_token(api_token) }
      render json: {}, status: :ok
    else
      render json: {}, status: :unauthorized
    end
  end
end
