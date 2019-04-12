require 'rails_helper'

feature 'Can view individual posts' do
  scenario 'Can click and view a single post' do
    post = create(:post, caption: 'Post 1')
    user = create(:user)
    sign_in_with user
    visit '/'
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/#{post.id}')]").click
    expect(page.current_path).to eq(post_path(post))
  end
end