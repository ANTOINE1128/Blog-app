# spec/system/user_show_spec.rb

require 'rails_helper'

RSpec.describe 'User Show Page', type: :system do

  before(:each) do
    # You can set up any necessary data here, such as creating a user and posts
    @user1 = User.create(name: 'John Doe', bio: 'Bio for John Doe', posts_counter: 4, photo: 'john_doe.jpg')
    @user = User.find_by(name: 'John Doe')

    # Create three recent posts for the user
    @post1 = @user1.posts.create(
      title: 'Fourth Post by John',
      content: 'Content of the fourth post by John',
      author_id: @user1.id,
      comments_counter: 0,
      likes_counter: 0
    )
    @post2 = @user1.posts.create(
      title: 'Third Post by John',
      content: 'Content of the third post by John',
      author_id: @user1.id,
      comments_counter: 0,
      likes_counter: 0
    )
    @post3 = @user1.posts.create(
      title: 'Second Post by John',
      content: 'Content of the second post by John',
      author_id: @user1.id,
      comments_counter: 0,
      likes_counter: 0
    )
  end

  it 'displays user details' do
    @user = User.find_by(name: 'John Doe') # Find the user by name
    visit user_path(@user)

    # Ensure the user's profile picture is displayed
    expect(page).to have_css('.user-photo')

    # Ensure the user's username is displayed
    expect(page).to have_content(@user.name)

    # Ensure the number of posts is displayed
    expect(page).to have_content("number of posts: #{@user.posts_counter}")

    # Ensure the user's bio is displayed
    expect(page).to have_content(@user.bio)
  end

  it "Should see the user's first 3 posts." do
    visit user_path(@user)
    expect(page).to have_content("Content of the fourth post by John")
    expect(page).to have_content(@post2.content)
    expect(page).to have_content(@post3.content)
  end

  it 'redirects to user posts index page when "See all posts" button is clicked' do
    visit user_path(@user)

    # Click on the "See all posts" button
    click_button('See all posts')

    # Now, you should be on the user's posts index page. You can verify this by checking the page content.
    expect(page).to have_content(@user.name)
    expect(page).to have_content('Posts for a User')
  end

  it 'redirects to the post show page when a post is clicked' do
    visit user_path(@user)

    # Find the first post and click on its link
    first('.post a').click

    # Now, you should be on the post show page. You can verify this by checking the page content.
    expect(page).to have_content(@user.name)
    expect(page).to have_content(@post1.title)
    # expect(page).to have_content(@post1.content)
  end
end
