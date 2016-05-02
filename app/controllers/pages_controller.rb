class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:home, :appointments, :checkin]
  
  def home
    if current_user.admin?
       render layout: "admin"
    end
  end

  def appointments
    if current_user.admin?
       render layout: "admin"
    end
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
  end
  
  def settings
    if current_user.admin?
       render layout: "admin"
    else
       redirect_to root_path
    end
  end 
end
