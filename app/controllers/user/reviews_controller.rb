class User::ReviewsController < ApplicationController

  def create
    #params[:game_id]
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.game_id = params[:game_id].to_i
    @review.score = Language.get_data(review_params[:introduction]) #自然言語処理
    @review.save
    redirect_to user_game_reviews_path
  end

  def index
    @game = Game.find(params[:game_id])#rails routesで確認
    @reviews = @game.reviews   #all(@game.id) #親とこの関係
    @reviews = @game.reviews.page(params[:page]).per(10)
    @review = Review.new #からのものを作る際は特定のカラムは必要ない
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
