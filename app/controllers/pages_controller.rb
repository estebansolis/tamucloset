class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:home, :appointments, :checkin]
  
  def home
    
  end

  def appointments
  end

  def available
  end

  def checkedout
  end

  def checkin
  end

  def checkout
    @rental = Rental.new
    @student = Student.new
  end

  def late
  end

  def manage
  end

  def signin
  end
  
  def auth
    render layout: "login"
    def resource_name
      :user
    end

    def resource
      @resource ||= User.new
    end

    def devise_mapping
      @devise_mapping ||= Devise.mappings[:user]
    end
  end
end
