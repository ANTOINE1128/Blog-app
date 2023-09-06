require 'rails_helper'
RSpec.describe 'Post Show Page', type: :system do
    before(:all) do
      # Create test data as needed
      @user = User.create(name: 'John Doe', bio: 'Bio for John Doe', posts_counter: 1, photo: 'john_doe.jpg')
  
   
  
      # Create a post associated with the user
      @post = @user.posts.create(
        title: 'Second Post by John',
        content: 'Content of the second post by John',
        comments_counter: 1 ,
        likes_counter:0
      )
  
  
      # Create a comment associated with the post and user
      @comment = @post.comments.create(
        text: "John's second post comment",
        author: @user
      )
    end
  
    it 'displays post information' do
      visit user_post_path(@user, @post)
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
  