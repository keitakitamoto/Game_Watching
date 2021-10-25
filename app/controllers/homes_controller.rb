class HomesController < ApplicationController
  def top
    @games = Game.order("updated_at").limit(3)
    #@new_games
    @all_ranks = Game.find(Like.group(:game_id).order('count(game_id) desc').limit(5).pluck(:game_id))
    @genres = Genre.all
  end

  def about
  end

end
