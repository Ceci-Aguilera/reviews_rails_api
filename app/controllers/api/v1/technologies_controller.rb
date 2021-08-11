class Api::V1::TechnologiesController < ApplicationController


  def index
    @technologies = Technology.all
    render json: {
      messages: "technology list loaded",
      is_success: true,
      data: {technologies: @technologies}
    }, status: :ok
  end



end
