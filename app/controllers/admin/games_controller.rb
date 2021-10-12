class Admin::GamesController < ApplicationController
  def new
    @game = Game.new
  end

  def index
    @games = Game.all
    @games = Game.page(params[:page]).per(10)
  end

  def show
    @game = Game.find(params[:id])
  end

  def edit
    @game = Game.find(params[:id])
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to game_path(@game.id)
    else
      render :new
    end
  end

  def destroy
    @game = Game.find(params.id)
    @game.destroy
    redirect_to games_path
  end

  private
  def game_params
    params.require(:game).permit(:title, :introduction, :body, :image_id)
  end
end
