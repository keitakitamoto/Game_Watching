class User::TopicsController < ApplicationController
  def index
    @topics = Topic.page(params[:page]).per(10)
    @newTopic = Topic.new
  end

  def show
    @topic = Topic.find(params[:id])
    @newpost = Post.new(:topic_id => params[:id])
    @posts = @topic.posts.page(params[:page]).per(10)
  end

  def create
    #ストロングパラメーターを追加したい
    @topic = Topic.new(params[:topic].permit(:title))
    @topic.save
    redirect_to user_topics_index_path
  end

  def delete
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to user_topics_index_path
  end
end
