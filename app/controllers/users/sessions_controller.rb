class Users::SessionsController < Devise::SessionsController
  respond_to :json

  def destroy 
    session[:user_id] = nil
  end

  private

  # Override verify_signed_out_user method
  def verify_signed_out_user
    # Do nothing to skip the verification
  end

  def respond_with(resource, _opts = {})
    if !resource.id.nil?
      render json: { message: 'You are logged in.' }, status: :created
    else
      render json: { message: 'Authentication failed.'}, status: :unauthorized
    end
  end

  def respond_to_on_destroy
    log_out_success && return if @logged_in_user

    log_out_failure
  end

  def log_out_success
    render json: { message: "You are logged out." }, status: :ok
  end

  def log_out_failure
    render json: { message: "Hmm nothing happened."}, status: :unauthorized
  end
end
