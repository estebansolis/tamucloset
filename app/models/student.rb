class Student < ActiveRecord::Base
    validates :UIN, presence: true
    validates :First_Name, presence: true
    validates :Last_Name, presence: true
    validates :Email, presence: true
    validates :Phone_Number, presence: true
    cattr_accessor :current_user
end