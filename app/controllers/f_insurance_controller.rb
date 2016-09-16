class FInsuranceController < ApplicationController


 def index
    @FInsurance = FInsurance.all
    respond_to do |format|
      format.html 
      format.json { render json: { :FInsurance => @FInsurance    } }
    end
  end





  def show
    person = @FInsurance.customer
         
  end

  # GET /insurances/new
  def new
    @FInsurance = FInsurance.new
  end

  # GET /insurances/1/edit
  def edit
  end

  # POST /insurances
  # POST /insurances.json
  def create

    @FInsurance = FInsurance.new(insurance_params)
     if  @FInsurance.save
        render :json => { :success => true, :insurance => @FInsurance, :message => 'ok todo salio ' }
    else
        render :json => {:success => false, :message => "Existe un error"}
    end

  end

  # PATCH/PUT /insurances/1
  # PATCH/PUT /insurances/1.json
  def update
     @FInsurance =FInsurance.find params[:id]
    if @FInsurance.update_attributes (insurance_params)
      render :json => { :success => true, :insurance =>  @FInsurance, :message => 'insurance add ok ' }
    else
        render :json => {:success => false, :message => "Existe un error"}
    end

  end

  # DELETE /insurances/1
  # DELETE /insurances/1.json
  def destroy
@FInsurance.destroy
    respond_to do |format|
      format.html { redirect_to insurances_url, notice: 'Insurance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_insurance   
    @FInsurance = FInsurance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def insurance_params

      params.require(:f_insurance).permit(:name , :expiration,:description ,:customer_id, :insured_name , :policy , :emergency, :refname , :features)

      #params.require(:insurance).permit(:name, :Description , :expiration , :customer_id, :insured_name,:policy,:emergency,:refname,:refname)
     # params.require(:insurance).permit(:name, :Description, :expiration)
    end
end
