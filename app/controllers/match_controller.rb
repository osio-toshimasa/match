class MatchController < ApplicationController
  def index
    puts 'Hello'
    render json: {
      message: 'Hello World'
    }
  end

  def create


    value = Rails.cache.fetch("/match/#{params[:id]}", expired_in: 1.hour) do
      params[:name]
    end

    render json: {
      id: 1,
      name: value
    }

  end



end
