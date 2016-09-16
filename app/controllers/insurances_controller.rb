class InsurancesController < ApplicationController
  before_action :set_insurance, only: [:show, :edit, :update, :destroy]
 include ApplicationHelper
  # GET /insurances
  # GET /insurances.json
  def index
    @insurances = Insurance.all
  end

  # GET /insurances/1
  # GET /insurances/1.json
  def show
    person = @insurance.customer
         
  end

  # GET /insurances/new
  def new
    @insurance = Insurance.new
  end

  # GET /insurances/1/edit
  def edit
  end

  # POST /insurances
  # POST /insurances.json
  def create
    @insurance = Insurance.new(insurance_params)

     if   @insurance.save
        render :json => { :success => true, :insurance =>  @insurance, :message => 'ok todo salio ' }
    else
        render :json => {:success => false, :message => "Existe un error"}
    end

  end

  # PATCH/PUT /insurances/1
  # PATCH/PUT /insurances/1.json
  def update
    

          
@insurance =Insurance.find params[:id]

    if @insurance.update_attributes (insurance_params)
        @insurance.customer 

      
       person = @insurance.customer
       if person.device != nil 
       person.device.iddevices
       setnotificasion( @insurance.name,@insurance.id.to_s,"Actualizar tu información",person.device.iddevices.to_s)
       render :json => { :success => true, :insurance =>  @insurance, :message => @response.read_body  }
     else 
      render :json => { :success => true, :insurance =>  @insurance, :message => 'insurance add ok ' }
       end 
    else
        render :json => {:success => false, :message => "Existe un error"}
    end

  end

  # DELETE /insurances/1
  # DELETE /insurances/1.json
  def destroy
    @insurance.destroy
    respond_to do |format|
      format.html { redirect_to insurances_url, notice: 'Insurance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_insurance
      @insurance = Insurance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def insurance_params

      params.require(:insurance).permit(:name , :expiration,:Description ,:customer_id, :insured_name , :policy , :emergency, :refname , :features)

      #params.require(:insurance).permit(:name, :Description , :expiration , :customer_id, :insured_name,:policy,:emergency,:refname,:refname)
     # params.require(:insurance).permit(:name, :Description, :expiration)
    end

end 

