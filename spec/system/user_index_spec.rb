require 'rails_helper'

RSpec.describe 'User Index Page', type: :system do
  before do
    # You can set up any necessary data here, such as creating users
    @user1 = User.create(name: 'John Doe', photo: 'john_doe.jpg', bio: 'Bio for John Doe', posts_counter: 4 )
    5.times do |i|
      Post.create(title: "Post #{i + 1}", author: @user, comments_counter: 0, likes_counter: 0)
    end
  end

  it 'displays the username of all other users' do
    # Visit the user index page directly using its URL
    visit users_path

    # For each user in the @users collection, check if their name is displayed
    [@user1].each do |user|
      expect(page).to have_content(user.name)
    end
  end

  it 'displays the profile picture for each user' do
    # Visit the user index page directly using its URL
    visit users_path
  
    # For each user in the @users collection, check if their profile picture is displayed
    [@user1].each do |user|
      if user.photo.present?
        expect(page).to have_css(".user-photo")
      end
    end
  end
  
  it 'displays the number of posts each user has written' do
    # Visit the user index page directly using its URL
    visit users_path
  
    # For each user in the @users collection, check if their number of posts is displayed
    [@user1].each do |user|
      expect(page).to have_content("Number of posts: #{user.posts_counter || 0}")
    end
  end

  it 'redirects to a user show page when a user is clicked' do
    # Visit the user index page
    visit users_path
  
    # Get the user_id of @user1
    user_id = @user1
  
    # Find the user link by using the user_id
    user_link = find("a[href='#{user_path(1)}']", visible: :all)
    user_link.click if user_link.visible?
  
    # Now, you should be on the user show page. You can verify this by checking the page content.
    expect(page).to have_content(@user1.name)
    expect(page).to have_content(@user1.bio)
    # Add more expectations as needed based on your user show page content.
  end
end
