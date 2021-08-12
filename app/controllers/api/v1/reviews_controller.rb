class Api::V1::ReviewsController < ApplicationController

  before_action :load_technology, only: :create
  before_action :ensure_params_exist, only: :create
  before_action :load_auth_user, only: :create

  def create
    @review = Review.new()
    # @review = Review.create(user_id: @use.id, technology_id: @technology.id)
    @review.user_id = @user.id
    @review.technology_id = @technology.id
    @review.username = @user.username
    @review.title = review_params[:title]
    @review.description = review_params[:description]
    @review.score = review_params[:score]
    @review.save()
    @technology.score = (@technology.score * @technology.amount + @review.score) / (@technology.amount + 1 * 1.0)
    @technology.amount = @technology.amount + 1
    @technology.save()
    render json: {
      messages: "review created",
      is_success: true,
      data: {review: @review}
    }, status: :ok
  end


  def show

  end







  def load_auth_user
    @user = User.where("email = ? and authentication_token = ?", review_params[:user_email], review_params[:user_token])[0]
    if @user.present?
      return @user
    else
      return render json: {
          messages: "User Missing",
          is_success: false,
          data: {}
        }, status: :bad_request
    end
  end

  def load_technology
    @technology = Technology.find(params[:id])
    if @technology
      return @technology
    else
      render json: {
        messages: "Cannot get Technology",
        is_success: false,
        data: {}
      }, status: :failure
    end
  end

  def review_params
    params.require(:create_review).permit(:title, :description, :score, :user_email, :user_token)
  end

  def ensure_params_exist
    return if params[:create_review].present?
    render json: {
        messages: "Missing Params",
        is_success: false,
        data: {}
      }, status: :bad_request
  end

end
