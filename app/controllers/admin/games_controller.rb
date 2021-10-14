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
    #byebug
    if @game.save!
      redirect_to admin_games_path(@game.id)
    else
      render :new
    end
  end

  def update
    @game = Game.find(params[:id])
   if @game.update(game_params)
     redirect_to admin_game_path(@game.id)
   else
     render :edit
   end
  end

  def destroy
    @game = Game.find(params[:id])
   if @game.destroy
     redirect_to admin_games_path
   else
     render :edit
   end
  end

  private
  def game_params
    params.require(:game).permit(:title, :introduction, :body, :image, :bonus_index, :genre_id)
  end
end
