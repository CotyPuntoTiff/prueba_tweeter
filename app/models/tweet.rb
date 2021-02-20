class Tweet < ApplicationRecord
    validates :contents, presence: true
    belongs_to :user
    has_many :likes, dependent: :destroy
    has_many :tweet
    belongs_to :tweets , optional: true, dependent: :destroy 

end
