class User::SearchController < ApplicationController
  def search
    if params[:genre_id].nil?
      @value = params["search"]["value"]         #データを代入(game_idとgenre_id)
      @how = params["search"]["how"]             #データを代入(検索方法)
      @datas = search_for(@how, @value)          #def search_forを実行(引数に検索ワードと検索方法)
    else
      @genre = Genre.find(params[:genre_id])
      @datas = @genre.games
    end
  end

private

  def match(value)　#whereで検索
    #.orを使用することで、valueに一致するカラムのデータをnameカラムとgenre_idカラムから探してくる
    game.where(name: value).or(Game.where(genre_id: value))
  end

  def forward(value)                              #forward以降はゲーム名検索の方法。
    Game.where("title LIKE ?", "#{value}%")
  end

  def backward(value)
    Game.where("title LIKE ?", "%#{value}")
  end

  def partical(value)
    Game.where("title LIKE ?", "%#{value}%")
  end


  def search_for(how, value)
    case how                     #引数のhowと一致する処理に進むように定義しています。
      when 'match'                 #ジャンル検索の場合はmatchで固定してるので、必ず'match'の処理に進みます。
        match(value)
      when 'forward'
        forward(value)
      when 'backward'
        backward(value)
      when 'partical'
        partical(value)
    end
  end
end
