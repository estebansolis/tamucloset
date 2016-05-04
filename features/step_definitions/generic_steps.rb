Given(/^A user is logged in as "([^"]*)"$/) do |arg1|
  @current_user = User.create!(
    :password => 'password1',
    :password_confirmation => 'password1',
    :email => "#{arg1}@gmail.com"
  )
  visit "/auth" 
  fill_in("user_email", :with => "#{arg1}@gmail.com") 
  fill_in("user_password", :with => 'password1') 
  click_button("Log in")
  expect(page.current_path == root_path)
end

When(/^I fill in the "([^"]*)" with "([^"]*)"$/) do |arg1, arg2|
  fill_in(arg1, :with => arg2)
end

Then(/^I expect to see "([^"]*)"$/) do |arg1|
  expect(page).to have_content(arg1)
end

When(/^I confirm popup$/) do
  page.driver.browser.switch_to.alert.accept 
end