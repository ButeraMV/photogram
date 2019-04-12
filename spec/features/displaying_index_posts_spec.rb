require 'rails_helper'

feature 'Index displays a list of posts' do
  background do
    user = create(:user)
    sign_in_with user
  end

  scenario 'the index displays correct created post information' do
    post_1 = create(:post, caption: 'Post 1')
    post_2 = create(:post, caption: 'Post 2')

    visit '/'
    expect(page).to have_content('Post 1')
    expect(page).to have_content('Post 2')
    expect(page).to have_css("img[src*='coffee']")
  end
end