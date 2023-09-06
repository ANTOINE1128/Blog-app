require 'rails_helper'

RSpec.describe 'User Post Index Page', type: :system do
  before(:all) do
    # Create users and posts as needed for your tests
    @user1 = User.create(name: 'John Doe', bio: 'Bio for John Doe', posts_counter: 3, photo: 'john_doe.jpg')
  
    @post1 = @user1.posts.create(
      title: 'new post 3',
      content: 'for new post 3',
      comments_counter: 3,
      likes_counter: 0
    )
  
    # Create @post2
    @post2 = @user1.posts.create(
      title: 'post 2',
      content: 'content for post 2',
      comments_counter: 2,  # You can set the number of comments as needed
      likes_counter: 5  # Set the number of likes as needed
    )
  
    # Create comments for post1
    @comment1 = @post1.comments.create(
      text: 'comment 1 new post',
      author: @user1
    )
    @comment2 = @post1.comments.create(
      text: 'comment 2 new post',
      author: @user1
    )
    @comment3 = @post1.comments.create(
      text: 'comment new post 3',
      author: @user1
    )
  
    # Create comments for post2
    @comment4 = @post2.comments.create(
      text: 'comment 1 post 2',
      author: @user1
    )
    @comment5 = @post2.comments.create(
      text: 'comment 2 post 2',
      author: @user1
    )
  end
  

  it 'displays user information' do
    visit users_path

    # Add your expectations here to verify user information is displayed
    expect(page).to have_content(@user1.name)
     
    expect(page).to have_css('.user-photo') # Assuming you have a CSS class for user photos
    expect(page).to have_content(@user1.posts_counter)
  end
  # it 'displays post titles' do
  #   visit user_posts_path(user_id: @user1.id)

  #   # Add your expectations here to verify post titles are displayed
  #   expect(page).to have_content(@post1.title)
  #   expect(page).to have_content(@post2.title)
  #   expect(page).to have_content(@post3.title)
  # end

  it 'displays post bodies' do
  visit user_posts_path(user_id: @user1.id)

  # Add your expectations here to verify post bodies are displayed
  expect(page).to have_content('for new post 3')  # Update this line
end


  it 'displays the first comments on posts' do
    visit user_posts_path(user_id: @user1)

    # Add your expectations here to verify the first comments on posts are displayed
    expect(page).to have_content(@post1.comments.first.text)
    # Add more expectations as needed
  end

  it 'displays the number of comments and likes for posts' do
    visit user_posts_path(user_id: @user1.id)

    # Add your expectations here to verify the number of comments and likes for posts are displayed
    expect(page).to have_content("#{@post1.comments_counter} comments")
    expect(page).to have_content("#{@post1.likes_counter} likes")
    # Add more expectations as needed
  end
end
