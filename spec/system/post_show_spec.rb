require 'rails_helper'
RSpec.describe 'Post Show Page', type: :system do
    before(:all) do
      # Create test data as needed
      user1 = User.create(name: 'User1', photo: 'user1.jpg', bio: 'Bio for User1', posts_counter: 0)
      5.times do |i|
        Post.create(title: "Post #{i + 1}", author: @user, comments_counter: 0, likes_counter: 0)
      end
    end
  
     
  
    it 'displays post information' do
      visit user_post_path(@user1, @post)
      # Add expectations to check if post details are displayed
      expect(page).to have_content(@post.title)
      expect(page).to have_content(@user.name)
      expect(page).to have_content("Comments: 1")
      expect(page).to have_content("Likes: 0")
    #   expect(page).to have_content(@post.content)
    end
  
    # it 'displays comments and comment authors' do
    #   visit user_post_path(@user , @post)
  
    #   # Add expectations to check if comments and comment authors are displayed
    #   expect(page).to have_content(@comment.author.name)
    #   expect(page).to have_content(@comment.text)
    # end
  end
  