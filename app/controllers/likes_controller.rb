class LikesController < ApplicationController

  def create
    @like = Like.new(user_id: current_user.id, tweet_id: params[:tweet_id])
    @like.save
    @tweet = Tweet.find_by(id: @like.tweet_id)
    @like_count = Like.where(tweet_id: params[:tweet_id]).count
    redirect_to("/tweets")
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, tweet_id: params[:tweet_id])
    @like.destroy
    @tweet = Tweet.find_by(id: @like.tweet_id)
    @like_count = Like.where(tweet_id: params[:tweet_id]).count
    redirect_to("/tweets")
  end

end
