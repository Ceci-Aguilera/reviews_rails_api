class Api::V1::SessionsController < Devise::SessionsController
  before_action :sign_in_params, only: :create
  before_action :load_user, only: :create
  skip_before_action :verify_signed_out_user


  # sign in
  def create
    if @user.valid_password?(sign_in_params[:password])
      sign_in "user", @user
      render json: {
        messages: "Signed In Successfully",
        is_success: true,
        data: {user: @user}
      }, status: :ok
    else
      render json: {
        messages: "Signed Failed - Unauthorized",
        is_success: false,
        data: {}
      }, status: :unauthorized
    end
  end



  def show
      @user = User.where("email = ? and authentication_token = ?", params[:user_email], params[:user_token])
      if @user.present?
        render json: {
          messages: "User Authenticated",
          is_success: true,
          data: {user: @user}
        }, status: :ok
      else
        render json: {
          messages: "Authenticated Failed - Unauthorized",
          is_success: false,
          data: {}
        }, status: :unauthorized
      end
  end

  def destroy
    @user = load_auth_user

    if @user.present?
      render json: {
        messages: "User Logout",
        is_success: true,
        data: {}
      }, status: :ok
    else
      render json: {
        messages: "Logout Failed - Unauthorized",
        is_success: false,
        data: {}
      }, status: :unauthorized
    end
  end


  private
  def sign_in_params
    params.require(:sign_in).permit :email, :password
  end

  private
  def sign_out_params
    params.require(:sign_out).permit :user_email, :user_token
  end

  def load_auth_user
    @user = User.where("email = ? and authentication_token = ?", params[:user_email], params[:user_token])
    if @user.present?
      return @user
    else
      return nil
    end
  end

  def load_user
    @user = User.find_for_database_authentication(email: sign_in_params[:email])
    if @user
      return @user
    else
      render json: {
        messages: "Cannot get User",
        is_success: false,
        data: {}
      }, status: :failure
    end
  end
end
