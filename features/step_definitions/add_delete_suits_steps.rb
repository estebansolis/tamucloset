Given(/^the following suits exist:$/) do |table|
  table.hashes.each do |apparel|
    Apparel.create(apparel)
  end
end

When(/^I follow the Available link$/) do
  visit available_path
end

When(/^I follow New Apparel link$/) do
  visit new_apparel_path
end