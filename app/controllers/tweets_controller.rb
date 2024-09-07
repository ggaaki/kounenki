class TweetsController < ApplicationController
  before_action :authenticate_user! 
  def top
  
    
  end
  def index
  
    @tweets = Tweet.where(release:1).order(id: "DESC")
  
    if params[:search] == nil
      @tweets= Tweet.all
    elsif params[:search] == ''
      @tweets= Tweet.all
    else
      @tweets = Tweet.where("title LIKE ? ",'%' + params[:search] + '%')
  
    end


    @tweets=Tweet.all
    if params[:tag_ids]
      @tweets = []
      params[:tag_ids].each do |key, value|
          if value == "1"
              tag_tweets = Tag.find_by(name: key).tweets
              @tweets = @tweets.empty? ? tag_tweets : @tweets & tag_tweets
          end
        end
        @tweets = @tweets.page(params[:page]).per(3)
    end
  end

  
  def new
    @tweet = Tweet.new
    if params[:tag]
      Tag.create(name: params[:tag])
    end
  end
  def create
    tweet = Tweet.new(tweet_params)
   tweet.user_id = current_user.id 
    if tweet.save
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

   

  # tweet = Tweet.new(tweet_params)
  
  # if tweet.save
  #   redirect_to :action => "index"
  #   if params[:tag_ids]
  #     @tweets = []
  #     params[:tag_ids].each do |key, value|
  #       if value == "1"
  #         tag_tweets = Tag.find_by(name: key).tweets
  #         @tweets = @tweets.empty? ? tag_tweets : @tweets & tag_tweets
  #       end
  #     end
  #   end
  # else
  #   redirect_to :action => "new"
  # end

  

 def show
  @tweet = Tweet.find(params[:id])
 end
 
 def edit
  @tweet = Tweet.find(params[:id])
 end
 def update
  tweet = Tweet.find(params[:id])
  if tweet.update(tweet_params)
    redirect_to :action => "show", :id => tweet.id
  else
    redirect_to :action => "new"
  end
 end

 def destroy
  tweet = Tweet.find(params[:id])
  tweet.destroy
  redirect_to action: :index
 end
 
 private
 def tweet_params
    params.require(:tweet).permit(:title, :image , :release, tag_ids: [] ) 
 end
end








