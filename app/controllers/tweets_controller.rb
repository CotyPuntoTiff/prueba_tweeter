class TweetsController < ApplicationController
    before_action :set_book, only: %i[ show edit update destroy ]
end
    def index
        @q = Tweet.ransack(params[:q])
        @tweet = @q.result(distinct: true).order(:asc).page(params[:page]).per(50)
     
    end
  
    def show
  
    end
  
    def new
        @tweet = Tweet.new
    end
  
    def create
        @tweet = Tweet.new(tweet_params)
    
        respond_to do |format|
            if @tweet.save
                format.html { redirect_to @tweet, notice: "El tweet fue creado" }
                format.json { render :show, status: :created, location: @tweet }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @tweet.errors, status: :unprocessable_entity }
            end
        end
    end
  
    def edit
    end
  
    def update
        respond_to do |format|
            if @tweet.update(tweet_params)
              format.html { redirect_to @tweet, notice: "los datos del libro fueron modificados" }
              format.json { render :show, status: :ok, location: @tweet }
            else
              format.html { render :edit, status: :unprocessable_entity }
              format.json { render json: @tweet.errors, status: :unprocessable_entity }
            end
          end
    end
  
    def destroy
        @tweet.destroy
        respond_to do |format|
          format.html { redirect_to books_url, notice: "El tweet fue destruido" }
          format.json { head :no_content }
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tweet_params
      params.require(:tweet).permit(:content, :id_user)
    end
  end
  