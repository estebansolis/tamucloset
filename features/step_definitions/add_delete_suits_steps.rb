Given(/^the following suits exist:$/) do |table|
  table.hashes.each do |apparel|
    Apparel.create(apparel)
  end
end