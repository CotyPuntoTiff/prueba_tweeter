class TweetsController < ApplicationController
    before_action :authenticate_user!, :except => [:index]
    before_action :set_tweet, only: %i[ show destroy ]

    def index
      @tweets = Tweet.order(:created_at).page(params[:page]).per(50)
        # @q = Tweet.ransack(params[:q])
        # @tweet = @q.result(distinct: true).order(:asc).page(params[:page]).per(50)
     
    end
  
    def show
  
    end
  
    def new
        @tweet = Tweet.new
    end
  
    def create 
        @tweet = Tweet.new(tweet_params)
        @tweet.user_id = current_user.id if current_user

        if @tweet.save
          flash[:success] = "Se creo exitosamente el Tweet"
          redirect_to root_path
        else
          flash[:error] = "Algo paso, intentalo de nuevo"
          render 'new'
        end
    end

  
    # def edit
    # end
  
    # def update
    #     respond_to do |format|
    #         if @tweet.update(tweet_params)
    #           format.html { redirect_to @tweet, notice: "el tweet fue modificado" }
    #           format.json { render :show, status: :ok, location: @tweet }
    #         else
    #           format.html { render :edit, status: :unprocessable_entity }
    #           format.json { render json: @tweet.errors, status: :unprocessable_entity }
    #         end
    #       end
    # end
  
    def destroy
        @tweet = Tweet.find(params[:id])
        if @tweet.destroy
            flash[:success] = 'El tweet fue borrado con exito.'
            redirect_to tweets_url
        else
            flash[:error] = 'algo paso, intentalo de nuevo'
            redirect_to tweets_url
        end
    end
    

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tweet_params
      params.require(:tweet).permit(:contents, :id_user)
    end
end
  