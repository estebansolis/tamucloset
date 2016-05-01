And(/^I see the calendar$/) do
  expect(page).to have_content(:class, 'calendars')
end