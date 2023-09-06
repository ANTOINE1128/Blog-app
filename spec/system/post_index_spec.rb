require 'rails_helper'

RSpec.describe 'User Index Page', type: :system do
    before do
      # You can set up any necessary data here, such as creating users
      @user1 = User.create(name: 'John Doe', bio: 'Bio for John Doe', posts_counter: 4 , photo: 'john_doe.jpg')

      @post1 = @user1.posts.create(
        title: 'Fourth Post by John',
        content: 'Content of the fourth post by John',
        author_id: @user1.id,
        comments_counter: 3,
        likes_counter: 0
      )
      comment1 = post1.comments.create(
        text: 'This is the second comment on John\'s post',
        author: user1
      )
      
    end