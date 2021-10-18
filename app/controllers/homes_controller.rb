class HomesController < ApplicationController
  def top
    @games = Game.order("updated_at")
    #@new_games
    #@all_ranks = Game.find(Like.group(:game_id).order('count(game_id) desc').limit(5).pluck(:game_id))
  end

  def about
  end

end
