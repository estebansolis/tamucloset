class Rental < ActiveRecord::Base
    validates :Rental_ID, presence: true
    validates :UIN, presence: true
    validates :Apparel_ID, presence: true
    validates :Checkout_Date, presence: true
    validates :Expected_Return_Date, presence: true
    validates :Return_Date, presence: false
    cattr_accessor :current_user
end