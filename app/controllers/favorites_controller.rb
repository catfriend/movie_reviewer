class FavoritesController < ApplicationController
  before_action :require_signin
  before_action :set_movie
  
  def create
    @movie.fans << current_user
    redirect_to @movie, notice: "Glad you've made this flick a fave!"
  end
  
  def destroy
    favorite = current_user.favorites.find(params[:id])
    favorite.destroy
    redirect_to @movie, notice: "OK, we get this isn't a favorite flick anymore!"
  end
  
private

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end
  
end
