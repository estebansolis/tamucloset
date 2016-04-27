Given(/^the following students exist:$/) do |table|
  table.hashes.each do |student|
    Student.create(student)
  end
end

Given(/^A user is logged in as "([^"]*)"$/) do |arg1|
  @current_user = User.create!(
    :password => 'generic',
    :password_confirmation => 'generic',
    :email => "#{arg1}@example.com"
  )
  visit "/signin" 
  fill_in("Email", :with => "#{arg1}@example.com") 
  fill_in("Password", :with => 'generic') 
  click_button("Log in")
  if page.respond_to? :should
    page.should have_content('Signed in successfully')
  else
    assert page.has_content?('Signed in successfully')
  end
end

When(/^I fill in the "([^"]*)" with "([^"]*)"$/) do |arg1, arg2|
  fill_in(arg1, :with => arg2)
end

When(/^I confirm popup$/) do
  page.driver.browser.switch_to.alert.accept 
end