class Tweet < ApplicationRecord
    validates :contents, presence: true
    belongs_to :user
    has_many :likes
end
