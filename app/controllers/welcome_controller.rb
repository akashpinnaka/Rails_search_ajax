class WelcomeController < ApplicationController
  def index
    @posts = Post.all    
    if(params[:query] && params[:query] != '')
      @search_query = params[:query]
      @posts = Post.where("title LIKE ?" , "%#{@search_query}%")
      # @posts = Post.where(title: @search_query)
      respond_to do |format|
        @response = {status: "SUCCESS", posts: @posts}
        format.json {render json: @response}
      end
    end
  end
end
