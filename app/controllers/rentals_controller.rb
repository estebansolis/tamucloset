class RentalsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_rental, only: [:show, :edit, :update, :destroy]
  
  if Rental.current_user.admin?
      layout "admin"
  else
      layout "application"
  end
  
  # GET /rentals
  # GET /rentals.json
  def index
    @rentals = Rental.all
  end

  # GET /rentals/1
  # GET /rentals/1.json
  def show
  end

  # GET /rentals/new
  def new
    @rental = Rental.new
    @student = Student.new
  end

  # GET /rentals/1/edit
  def edit
  end

  # POST /rentals
  # POST /rentals.json
  def create
    
    @rental = Rental.new(rental_params)
    if(!@rental.nil?)
      if @rental.UIN.length != 9
        flash[:notice] = "UIN cannot be less than 9 digits"
        redirect_to checkout_path
      end
    elsif(Apparel.exists?(Apparel_ID: @rental.Apparel_ID) ) #find if Apparel id exist
      @apparel = Apparel.find_by(Apparel_ID: @rental.Apparel_ID)
      if(@apparel.Status === "IN" ) #if it exist and is not checked out, list as checked out
        @apparel.Status = "OUT"
        @apparel.save
        if(Student.exists?(UIN: @rental.UIN)) # does a new student need to be added?
          respond_to do |format|
            if @rental.save
              format.html { redirect_to rentals_path}
              format.json { render :show, status: :created, location: @rental }
            else
              format.html { render :new }
              format.json { render json: @rental.errors, status: :unprocessable_entity }
            end
        end
        else
          respond_to do |format|
            if @rental.save
              format.html { redirect_to new_student_path(:uin => @rental.UIN)}
              format.json { render :show, status: :created, location: @rental }
            else
              format.html { render :new }
              format.json { render json: @rental.errors, status: :unprocessable_entity }
            end
          end
        end      
      else
        flash[:notice] =  'Apparel is listed as checked out' 
        redirect_to checkout_path
      end
    else
        flash[:notice] =  'Apparel does not exist or fields left blank'#format.html { redirect_to checkout_path, notice: 'Apparel does not exist' } #id not found
        redirect_to checkout_path
    end
  end

  # PATCH/PUT /rentals/1
  # PATCH/PUT /rentals/1.json
  def update
    if Rental.current_user.admin?
      respond_to do |format|
        if @rental.update(rental_params)
          format.html { redirect_to rentals_path}
          format.json { render :show, status: :ok, location: @rental }
        else
          format.html { render :edit }
          format.json { render json: @rental.errors, status: :unprocessable_entity }
        end
      end
    else 
      redirect_to rentals_path
    end
  end

  # DELETE /rentals/1
  # DELETE /rentals/1.json
  def destroy
    if Rental.current_user.admin?
      @rental.destroy
      respond_to do |format|
        format.html { redirect_to rentals_url}
        format.json { head :no_content }
      end
    else 
      redirect_to rentals_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rental
      @rental = Rental.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rental_params
      params.require(:rental).permit(:Rental_ID, :UIN, :Apparel_ID, :Checkout_Date, :Expected_Return_Date, :Return_Date)
    end
end
