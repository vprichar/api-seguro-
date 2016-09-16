class ApikeyController < ApplicationController
	before_action :set_insurance, only: [:show, :edit, :update, :destroy]

  def index
    @apikey = Apikey.all
  end

  def show
  end

  def new
    @apikey =Apikey.new 
    @apikey.save
    respond_to do |format|
      format.html 
      format.json { render :json =>  @apikey }
  end


  def token 
  	 @apikey = Apikey.new
  	 @apikey.save


  end 

     



  end


  
 
  def edit
  end

  
  def create
   @apikey = Apikey.new(insurance_params)

    respond_to do |format|
      if @insurance.save
        format.html { redirect_to @apikey, notice: 'Insurance was successfully created.' }
        format.json { render :show, status: :created, location: @apikey }
      else
        format.html { render :new }
        format.json { render json:@apikey.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def update
    respond_to do |format|
      if @apikey.update(insurance_params)
        format.html { redirect_to @apikey, notice: 'Insurance was successfully updated.' }
        format.json { render :show, status: :ok, location: @apikey }
      else
        format.html { render :edit }
        format.json { render json: @apikey.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
   @apikey.destroy
    respond_to do |format|
      format.html { redirect_to insurances_url, notice: 'Insurance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
 

    def set_insurance
      @apikey = Apikey.find(params[:id])
    end


    def insurance_params
      params.require(:insurance).permit(:name, :Description, :expiration)
    end


end

