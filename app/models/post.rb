class Post < ApplicationRecord
    belongs_to :user

    has_many :photos, dependent: :destroy

    has_many :like, -> { order(created_at: :desc) }, dependent: :destroy

    accepts_nested_attributes_for :photos

    has_many :comments

    
    def liked_by(user)
        Like.find_by(user_id: user.id, post_id: id)
    end

    def commented_by(user)
        Comment.find_by(user_id: user.id, post_id: id)
    end
end
