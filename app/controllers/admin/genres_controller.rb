class Admin::GenresController < ApplicationController
  before_action :set_genre, only: [:edit,:update,:destroy]

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to genres_path
    else
      @genres = genre.all
      render 'index'
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    if @genre.update(genre_params)
      redirect_to genres_path
    else
      render 'edit'
    end
  end

  def destroy
    @genre.destroy
    redirect_to genres_path
  end

  private

  def set_genre
    @genre = Genre.find(params[:id])
  end

  def genre_params
    params.require(:genre).permit(:name)
  end
end
