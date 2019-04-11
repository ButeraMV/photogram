feature 'Creating a new user' do
  background do
    visit '/'
    click_link 'Register'
  end

  scenario 'can create a new user via the index page' do
    fill_in 'Username', with: 'railsdev'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
   end

  scenario 'requires a user name to successfully create an account' do
    fill_in 'Email', with: 'test@test.com'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content("can't be blank")
  end

  scenario 'requires a username to be 4 or more characters' do
    fill_in 'Username', with: 'h'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content('minimum is 4 characters')
  end

  scenario 'requires a username to be 16 or less characters' do
    fill_in 'Username', with: 'h' * 17
    fill_in 'Email', with: 'test@test.com'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content('maximum is 16 characters')
  end
end