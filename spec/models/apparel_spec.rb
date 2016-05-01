require 'rails_helper'

RSpec.describe Apparel, type: :model do
    before :each do
        Apparel.create(Apparel_ID:'1234',Sex:'Female',Article:'Pants',Size:'30',Status:'In')
    end
    it 'Should Create Apparel Object' do
        expect(:index).to eq(:index)
    end
end