class Admin::GenresController < ApplicationController
  #before_action :set_genre, only: [:edit,:update,:destroy]

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    @genres = Genre.all
    @genre = Genre.new(genre_params)

    if @genre.save
      redirect_to admin_genres_path
      #@genres = Genre.all
    else
      render 'index'
    end

  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genres_path
    else
      render 'edit'
    end
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to admin_genres_path
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
  #def set_genre
   # @genre = Genre.find(params[:id])
  #end

  #def genre_params
   # params.require(:genre).permit(:name)
  #end
end
