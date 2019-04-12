require 'rails_helper'

feature 'Editing posts' do
  background do
    post = create(:post, caption: 'Post 1')
    user = create(:user)
    sign_in_with user
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/#{post.id}')]").click
    click_link 'Edit Post'
  end

  scenario 'can edit a post' do
    fill_in 'Caption', with: 'Oops'
    click_button 'Update Post'
    expect(page).to have_content('Post updated')
    expect(page).to have_content('Oops')
  end

  it "won't update a post without an image" do
    attach_file('Image', 'spec/files/coffee.zip')
    click_button 'Update Post'

    expect(page).to have_content("Something is wrong with your form")
  end
end