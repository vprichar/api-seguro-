class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all.map {|t| t.to_h}

    #Collection.all.map {|t| t.to_h}

    @seguros =Device.count

    respond_to do |format|
      format.html 
      format.json { render json: { :customers => @customers , :seguros =>  @seguros    } }
    end
  end


 def  fseguros 
    @seguros = FInsurance.all 

   render json:{:domiseguros => @seguros}

  end 

 
  def show
    set_customer
    @seguros =  @customer.insurance
   
    

    respond_to do |format|
      format.html 
      format.json { render json: { :customers => @customer , :seguros =>@seguros , :device =>   @customer.device } }
    end
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)

    if  @customer.save
        render :json => { :success => true, :brand =>  @customer, :message => 'La marca ha sido agregada.' }
    else
      render :json => {:success => false, :message => "Existe un error"}
    end
  end

  
         


  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json



  def update
    @Customer = Customer.find params[:id]
    if @Customer.update_attributes (customer_params)
        render :json => { :success => true, :Customer =>   @Customer, :message => 'customer add ok ' }
    else
        render :json => {:success => false, :message => "Existe un error"}
    end
  end



  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

   
    def customer_params
      params.require(:customer).permit(:name, :daten, :email, :usertoken, :phone)
     
    end
end
