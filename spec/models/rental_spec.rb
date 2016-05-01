require 'rails_helper'

RSpec.describe Rental, type: :model do
    before :each do
        Rental.create(Rental_ID:'1234',UIN:'123456789',Apparel_ID:'12',Checkout_Date:'04-12-2016',Expected_Return_Date:'04-16-2016',Return_Date:'04-14-2016')
    end
    it 'Should Create Rental Object' do
        expect(:index).to eq(:index)
    end
end
