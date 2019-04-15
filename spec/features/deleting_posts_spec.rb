require 'rails_helper'

feature 'Deleting posts' do
  background do
    user = create :user
    post = create(:post, user_id: user.id)
    sign_in_with user
    find(:xpath, "//a[contains(@href,'posts/#{post.id}')]").click
    click_link 'Edit Post'
  end
  scenario 'Can delete a single post' do
    click_link 'Delete Post'
    expect(page).to have_content('Post deleted')
    expect(page).to_not have_content('Post 1')
  end
end