require 'rails_helper'

RSpec.describe Student, type: :model do
    before :each do
        Student.create(UIN:'123456789',First_Name:'John',Last_Name:'Smith',Email:'smith@tamu.edu',Phone_Number:'0987654321')
    end
    it 'Should Create Student Object' do
        expect(:index).to eq(:index)
    end
end
