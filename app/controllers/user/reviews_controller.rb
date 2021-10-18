class User::ReviewsController < ApplicationController

  def create
    #params[:game_id]
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.game_id = params[:game_id].to_i
    @review.save
    redirect_to user_game_reviews_path
  end

  def index
    @reviews = Review.all
    @review = Review.new
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to user_game_review_path(@review.game.id)
  end

  private

   def review_params
     params.require(:review).permit(:title, :introduction, :rate)
   end

end
