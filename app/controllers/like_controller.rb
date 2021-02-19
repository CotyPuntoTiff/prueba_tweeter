class LikesController < ApplicationController
    before_action :find_tweet
    def index

    end
  
    def show
  
    end
  
    def new
    end
  
    def creates
      @tweet.likes.create(user_id: current_user.id)
      redirect_to tweet_path(@post)
    end
  
    def edit
    end
  
    def update
    end
  
    def destroy

    end
    private 
    def find_tweet
      @tweet = tweet.find(params[:tweet_id])
      
    end
    
    
  end
  