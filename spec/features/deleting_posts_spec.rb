require 'rails_helper'

feature 'Deleting posts' do
  background do
    post = create(:post, caption: 'Post 1')
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/#{post.id}')]").click
    click_link 'Edit Post'
  end
  scenario 'Can delete a single post' do
    click_link 'Delete Post'
    expect(page).to have_content('Post deleted')
    expect(page).to_not have_content('Post 1')
  end
end