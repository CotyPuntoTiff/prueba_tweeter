class Friend < ApplicationRecord
belongs_to :user

    def tweets_for_me
        for_me = (friend.friend_id == current_user.id)  
    end
end
