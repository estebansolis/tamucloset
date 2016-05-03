FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end
end

FactoryGirl.define do
  factory :user, :class => 'User' do
    email
    password 'password1234'
    password_confirmation 'password1234'
    
    factory :admin do
      admin true
    end
  end
end