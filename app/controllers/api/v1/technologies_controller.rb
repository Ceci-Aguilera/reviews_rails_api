class Api::V1::TechnologiesController < ApplicationController

  before_action :load_technology, only: [:show]



  def index
    @technologies = Technology.all
    render json: {
      messages: "technology list loaded",
      is_success: true,
      data: {technologies: @technologies}
    }, status: :ok
  end


  def show
    render json: {
      messages: "technology loaded",
      is_success: true,
      data: {technology: @technology}
    }, status: :ok
  end




  private
  def technology_params
    params.require(:technology).permit :id
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



end
