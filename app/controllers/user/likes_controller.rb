class User::LikesController < ApplicationController

  before_action :authenticate_user!

  def create
    review = Review.find(params[:review_id])
    like = current_user.likes.new(review_id: review.id)
    like.save
    redirect_to user_game_reviews_path(review)
  end

  def destroy
    review = Review.find(params[:review_id])
    like = current_user.likes.find_by(review_id: review.id)
    like.destroy
    redirect_to user_game_reviews_path(review)
  end

  def create
    @game = Game.find(params[:game_id])
    like = current_user.likes.new(game_id: @game.id)
    like.save
    #redirect_to user_game_path(game)
  end

  def destroy
    @game = Game.find(params[:game_id])
    like = current_user.likes.find_by(game_id: @game.id)
    like.destroy
    #redirect_to user_game_path(game)
  end


end
