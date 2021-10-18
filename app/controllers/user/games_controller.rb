class User::GamesController < ApplicationController
  def index
    @game = Game.all
    @games = Game.page(params[:page]).per(10)
    @reviews = Review.all
  end

  def show
    @game = Game.find(params[:id])
    #@review = Review.average(:evaluation)
    #@game_reviews = @game.game_reviews.order('created_at DESC').page(params[:page])
    #counts(@game)
  end

  def counts(game)
    @count_game_reviews = game.game_reviews.count
  end

  def average(game)
    @average_game_reviews = Review.group(:game_id).average(:evaluation)
  end

end
