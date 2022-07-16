class MatchController < ApplicationController
  def index
    puts 'Hello'
    render json: {
      message: 'Hello World'
    }
  end

  def create
    #@post = Post.find(params[:id])

    render json: {
      id: params[:id]
    }

    # メモリキャッシュ
    # if stale?(last_modified: @post.updated_at)
    #   render json: @post
    # end
  end



end
