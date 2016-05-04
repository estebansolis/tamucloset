FactoryGirl.define do
  sequence :email do |n|
    "cfajitas@gmail.com"
  end
end

FactoryGirl.define do
  factory :user, :class => 'User' do
    email 'cfajitas@gmail.com'
    password 'password1'
    password_confirmation 'password1'
    
    factory :admin do
      admin true
    end
  end
end

FactoryGirl.define do
  factory :apparel do
    Apparel_ID '1'
    Sex 'Male'
    Article 'Suit'
    Size '32'
    Status 'In'
  end
end

FactoryGirl.define do
  factory :rental do
    Rental_ID '1'
    UIN '123456789'
    Apparel_ID '12'
    Checkout_Date '04-12-2016'
    Expected_Return_Date '04-16-2016'
    Return_Date '04-14-2016'
  end
end

FactoryGirl.define do
  factory :student do
    UIN '123456789'
    First_Name 'John'
    Last_Name 'Smith'
    Email 'Smith@tamu.edu'
    Phone_Number '1234567890'
  end
end