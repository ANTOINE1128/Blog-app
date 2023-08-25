class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes
  def update_posts_counter
    author.update(posts_counter: author.posts.count)
  end

  def recent_comments(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end

  def update_likes_counter
    update(likes_counter: likes.count)
  end
end
