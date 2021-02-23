class TweetsController < ApplicationController
    ## Get Route
    def index
        render json: {status: 200, tweets: Tweet.all}
    end

    ## Show Route
    def show
        tweet = Tweet.find(params[:id])
        render(json: { tweet: tweet})
    end

    ## Create Route
    def create
    tweet = Tweet.new(tweet_params)
    if tweet.save
        render json: { tweet: tweet}
    else
        render(status: 422, json: { tweet: tweet, errors: tweet.errors})
    end
end

    ##Update Route
    def update
        tweet = Tweet.find(params[:id])
        tweet.update(tweet_params)
        render(json: {tweet: tweet})
    end

    private

    def tweet_params
        params.require(:tweet).permit(:title, :content, :author)
    end
end