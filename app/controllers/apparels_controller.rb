

class ApparelsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :set_apparel, only: [:show, :edit, :update, :destroy]
  
  
  if Apparel.current_user.try(:admin?)
      layout "admin"
  else
      layout "application"
  end
  
  # GET /apparels
  # GET /apparels.json
  def index
    @apparels = Apparel.all
  end

  # GET /apparels/1
  # GET /apparels/1.json
  def show
  end

  # GET /apparels/new
  def new
    @apparel = Apparel.new
  end

  # GET /apparels/1/edit
  def edit
  end

  # POST /apparels
  # POST /apparels.json
  def create
    @apparel = Apparel.new(apparel_params)

    respond_to do |format|
      if @apparel.save
        format.html { redirect_to available_path}
        format.json { render :show, status: :created, location: @apparel }
      else
        format.html { render :new }
        format.json { render json: @apparel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apparels/1
  # PATCH/PUT /apparels/1.json
  def update
    if Apparel.current_user.admin?
      respond_to do |format|
        if @apparel.update(apparel_params)
          format.html { redirect_to available_path, notice: 'Apparel was successfully updated.' }
          format.json { render :show, status: :ok, location: @apparel }
        else
          format.html { render :edit }
          format.json { render json: @apparel.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to available_path
    end
  end

  # DELETE /apparels/1
  # DELETE /apparels/1.json
  def destroy
    if Apparel.current_user.admin? 
      @apparel.destroy
      respond_to do |format|
        format.html { redirect_to available_path}
        format.json { head :no_content }
      end
    else
      redirect_to available_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apparel
      @apparel = Apparel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apparel_params
      params.require(:apparel).permit(:Apparel_ID, :Sex, :Article, :Size, :Status)
    end
end
