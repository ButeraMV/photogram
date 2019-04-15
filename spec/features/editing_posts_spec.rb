require 'rails_helper'

feature 'Editing posts' do
  background do
    user = create(:user)
    user_two = create(:user, email: 'hi@hi.com', username: 'Arnie', id: user.id + 1)
    @post = create(:post, user_id: user.id)
    @post_two = create(:post, user_id: user.id + 1)
    sign_in_with user
    visit '/'

  end

  scenario 'can edit a post as owner' do
    find(:xpath, "//a[contains(@href,'posts/#{@post.id}')]").click
    expect(page).to have_content('Edit Post')
    click_link 'Edit Post'
    fill_in 'Caption', with: 'Oops'
    click_button 'Update Post'
    expect(page).to have_content('Post updated')
    expect(page).to have_content('Oops')
  end

  scenario "cannot edit a post that doesn't belong to you via the show page" do
    find(:xpath, "//a[contains(@href,'posts/#{@post_two.id}')]").click
    expect(page).to_not have_content('Edit Post')
  end

  scenario "cannot edit a post that doesn't belong to you via url path" do
    visit "/posts/#{@post_two.id}/edit"
    expect(page.current_path).to eq root_path
    expect(page).to have_content("That post doesn't belong to you!")
  end

  it "won't update a post without an image" do
    find(:xpath, "//a[contains(@href,'posts/#{@post.id}')]").click
    click_link 'Edit Post'
    attach_file('Image', 'spec/files/coffee.zip')
    click_button 'Update Post'

    expect(page).to have_content("Something is wrong with your form")
  end
end