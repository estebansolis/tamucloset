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

  def rental_return

      @rental = Rental.find_by( UIN: params[:uin], Apparel_ID: params[:app])
      if (@rental.nil?)
        flash[:notice] = "rental does not exist"
        redirect_to root_path
      else
        @apparel = Apparel.find_by(Apparel_ID: params[:app])
        if(@apparel.Status === "IN")
          flash[:alert] = "rental does not exist"
          redirect_to root_path
        else
          @apparel.Status = "IN"
          @apparel.save
          @rental.Return_Date = params[:date]
          @rental.save
          redirect_to checkin_path
          flash[:notice] = "Check in Successful"
        end
      end
  end
  
  def checkin

    if current_user.admin?
       render layout: "admin"
    end
      @rental = Rental.new
      if(!params[:app].nil?)
        respond_to do |format|
          format.html { redirect_to return_path(:app =>params[:app], :uin => params[:uin], :date => params[:date])}
          format.json { render :show, status: :created, location: @rental }
          end
        end
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
