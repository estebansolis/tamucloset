Given(/^the following students exist:$/) do |table|
  table.hashes.each do |student|
    Student.create(student)
  end
end

When(/^I follow the Students link$/) do
  visit students_path
end