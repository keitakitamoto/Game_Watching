class User::SearchController < ApplicationController
  def Search
    game_param = GameSearchParams.new(genre_id: params[:id])
    if game_param.invalid?
      redirect_to root_path
    end
  end
end
