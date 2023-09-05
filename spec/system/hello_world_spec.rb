require 'rails_helper'
RSpec.describe 'hello world', type: :system do
  scenario 'index page' do
    visit hello_world_index_path
    expect(page).to have_content ('hello world')
  end
end

