class CampaignsController < ApplicationController
  before_action :set_campaign, only: [:show, :edit, :update, :destroy]

  # GET /campaigns
  # GET /campaigns.json
  def index
    @campaigns = Campaign.all
  new 

  end



def getgrafica 
 # set_campaign
  @campaign
  # @data = @campaign.datums 

 #  render json:  @data.pluck
 render json:   params[:id]

   #.pluck (:id)
end 

  def conta

     id = params[:idcampaigns]
     campaign = Campaign.find_by(id:id)

     datos =  Datum.new
     datos.campaign_id = campaign.id
     datos .save 

   
  


     if campaign == nil 
       render json:"es nulo"
     else 
      tem = 0

    if campaign.open == nil
      tem = 1 
    else 
      tem = campaign.open
      tem = (tem+1)

    end 
  

     campaign.open =tem 
     campaign.save
     render json: campaign.open

     end 
        


   
      

  end 

  # GET /campaigns/1
  # GET /campaigns/1.json


  def show
set_campaign
 


  end


  def getmensa
    set_campaign
    mensaje(@campaign.body,@campaign.id,@campaign.name)
    json = JSON.parse (@response.read_body)

   @dame =  json
   @campaign.successful =  @success = json['success']
   @campaign.error = @failure = json['failure']
   @canonical_ids = json['canonical_ids']
   @results = json['results']
   @campaign.save


   respond_to do |format|
    
        format.html { redirect_to action: "index"   }
        format.json { render :show, status: :created, location: @campaign }
     
    end

  end 



  # GET /campaigns/new
  def new
    @campaign = Campaign.new
  end

  # GET /campaigns/1/edit
  def edit
  end

def mensaje(mensaje,id,tile)
  set_campaign

require 'uri'
require 'net/http'
ids = Device.pluck (:iddevices)

@sent = Device.count
if @sent != nil 
 @campaign.sent = @sent
else 
  @campaign.sent = 0 
  end 




#
url = URI("https://fcm.googleapis.com/fcm/send")
http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE
@request = Net::HTTP::Post.new(url)
@request["authorization"] = 'key=AIzaSyANUQUCECwwwPY2WDv9qw3Bw9VA84a9Sac'
@request["content-type"] = 'application/json'


@request.body = "{ \"data\": 
                  {\"title\":\""+tile.to_s+"\",
                    \"message\":\""+mensaje.to_s+"\",
                    \"type\":\"1\",
                   \"idcampaigns\": \""+ id.to_s+"\"},
                   \"registration_ids\" :"+ids.to_s+"}"



@response = http.request(@request)
@response.read_body


end 
  def create
    @campaign = Campaign.new(campaign_params)
    @campaign.sent =0 
    @campaign.successful =0 
    @campaign.error =0 
    @campaign.open = 0 


    respond_to do |format|
      if @campaign.save
        format.html { redirect_to @campaign, notice: ' La campaña se ha creado correctamente .' }
        format.json { render :show, status: :created, location: @campaign }
      else
        format.html { render :new }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campaigns/1
  # PATCH/PUT /campaigns/1.json
  def update
    respond_to do |format|
      if @campaign.update(campaign_params)
        format.html { redirect_to @campaign, notice: ' La campaña se ha actualizado correctamente .' }
        format.json { render :show, status: :ok, location: @campaign }
      else
        format.html { render :edit }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campaigns/1
  # DELETE /campaigns/1.json
  def destroy
    @campaign.destroy
    respond_to do |format|
      format.html { redirect_to campaigns_url, notice: 'la campaña fue destruido con éxito ..' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign
      @campaign = Campaign.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def campaign_params
      params.require(:campaign).permit(:name, :body, :sent, :successful, :error,:direcion , :data)
    end
end
