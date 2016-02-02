class Api::PunchesController < ActionController::Base
  respond_to :json
  before_filter :authenticate_with_token

  def index
    render json: {}, status: :ok
  end

  def create
    punch = Punch::Register.punch(@current_user, punch_attributes)
    if punch.save
      render json: as_api_json(punch), status: :ok
    end
  end

  private

  def authenticate_with_token
    if found_user = authenticate_with_http_token { |api_token, options| User.find_by_api_token(api_token) }
      @current_user = found_user
    else
      render json: {}, status: :unauthorized
    end
  end

  def as_api_json(punch)
    punch.as_json(only: [:id, :time])
  end

  def punch_attributes
    params[:time] ||= Time.now
    params.permit(:time)
  end
end
