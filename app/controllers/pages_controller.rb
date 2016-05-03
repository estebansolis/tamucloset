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

    @rental = Rental.find_by( UIN: params[:uin], Apparel_ID: params[:app], Return_Date: nil)
    if (@rental.nil?)
      flash[:notice] = "Rental does not exist"
      redirect_to checkin_path
    else
      @apparel = Apparel.find_by(Apparel_ID: params[:app])
      if(@apparel.Status === "IN")
        flash[:notice] = "Apparels table shows item in"
        redirect_to checkin_path
      else
        @apparel.Status = "IN"
        @apparel.save
        @rental.Return_Date = params[:date]
        @rental.save
        flash[:notice] = "Check in Successful"          
        redirect_to checkin_path
      end
    end
  end
  
  def checkin

    if current_user.admin?
       render layout: "admin"
    end
      @rental = Rental.new
      if(!params[:app].nil? && !params[:uin].nil? &&!params[:date].nil?)
        respond_to do |format|
          if(params[:uin].length === 9) #check uin
            format.html { redirect_to return_path(:app =>params[:app], :uin => params[:uin], :date => params[:date])}
            format.json { render :show, status: :created, location: @rental }
          else
            format.html { redirect_to checkin_path, notice: "UIN must be 9 digits"}
            format.json { render :show, status: :created, location: @rental }
          end
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
