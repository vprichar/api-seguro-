class DevicesController < ApplicationController






  def index
    @devices =Device.all
    render json:{:domiseguros =>   @devices}
  end

    def device_params
      params.require(:device).permit(:iddevices)
    end
end

