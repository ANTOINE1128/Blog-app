require 'rails_helper'

RSpec.feature 'User Post Index Page', type: :feature do
  let(:user) { User.create(name: 'Tom', bio: 'He is a good programmer', photo: 'https://www.example.com/photo.png') }
  let!(:post1) { Post.create(author: user, title: 'First Post', text: 'Lorem ipsum dolor sit amet.') }
  let!(:post2) { Post.create(author: user, title: 'Second Post', text: 'Consectetur adipiscing elit.') }
  # Create comments and likes as needed for the tests.

  before do
    visit user_posts_path(@user)
  end

  scenario 'I can see the user\'s profile picture' do
    expect(page).to have_selector("img[src='#{user.photo}']")
  end

  # scenario 'I can see the user\'s username' do
  #   expect(page).to have_content(user.name)
  # end

  # scenario 'I can see the number of posts the user has written' do
  #   expect(page).to have_content("Number of posts: #{user.posts.count}")
  # end

  # scenario 'I can see a post\'s title' do
  #   expect(page).to have_content(post1.title)
  #   expect(page).to have_content(post2.title)
  # end

  # scenario 'I can see some of the post\'s body' do
  #   expect(page).to have_content(post1.text[0..50]) # Display only the first 50 characters.
  #   expect(page).to have_content(post2.text[0..50])
  # end

  # scenario 'I can see the first comments on a post' do
  #   # Write Capybara code to check if the first comments are visible.
  # end

  # scenario 'I can see how many comments a post has' do
  #   # Write Capybara code to check if the comment count is visible for each post.
  # end

  # scenario 'I can see how many likes a post has' do
  #   # Write Capybara code to check if the like count is visible for each post.
  # end

  # scenario 'I can see a section for pagination if there are more posts than fit on the view' do
  #   # Write Capybara code to check if the pagination section is visible.
  # end

  # scenario 'When I click on a post, it redirects me to that post\'s show page' do
  #   click_link 'First Post' # Click the link for the first post.
  #   expect(page).to have_current_path(user_post_path(user, post1))
  # end
end
