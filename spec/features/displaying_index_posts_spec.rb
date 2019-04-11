# Create multiple posts using factories.
# User visits the root route.
# User can see the comments and images of the posts we’ve created.

require 'rails_helper'

feature 'Index displays a list of posts' do
  scenario 'the index displays correct created post information' do
    post_1 = create(:post, caption: 'Post 1')
    post_2 = create(:post, caption: 'Post 2')

    visit '/'
    expect(page).to have_content('Post 1')
    expect(page).to have_content('Post 2')
    expect(page).to have_css("img[src*='coffee']")
  end
end