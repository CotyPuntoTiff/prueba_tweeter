class FriendsController < ApplicationController
    def create
        @friend = Friend.new
        @friend_user = User.find(params[:friend_id])
        @friend.friend_id = @friend_user.id #poner el id de usuario friend
        @friend.user_id = current_user.id

        if @friend.save
            flash[:alert] = "Se agrego exitosamente como amigo"
            redirect_to user_profile_path(@friend_user)
          else
            flash[:alert] = "Algo paso, intentalo de nuevo"
            redirect_to user_profile_path(@friend_user)
          end
    end

    def destroy
        @friend_user = User.find(params[:id])
        @friend = Friend.where(user_id: current_user.id, friend_id: params[:id]).first
        if @friend.destroy
            flash[:alert] = 'El amigo fue borrado con exito.'
            redirect_to user_profile_path(@friend_user)
        else
            flash[:alert] = 'algo paso, intentalo de nuevo'
            redirect_to user_profile_path(@friend_user)
        end
    end
end

