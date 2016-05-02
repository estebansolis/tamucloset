class Apparel < ActiveRecord::Base
    validates :Apparel_ID, presence: true
    validates :Sex, presence: true
    validates :Article, presence: true
    validates :Size, presence: true
    validates :Status, presence: true
    cattr_accessor :current_user
end
