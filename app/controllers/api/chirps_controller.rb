class Api::ChirpsController < ApplicationController
  def index
    chirps = Chirp.all
    render json: chirps
  end

  def create
    chirp = Chirp.new(chirp_params)
    chirp.author_id = User.all.sample.id

    if chirp.save
      render json: chirp
    else
      render json: chirp.errors.full_messages, status: 422
    end
  end

  def chirp_params
    params.require(:chirp).permit(:body)
  end
end
