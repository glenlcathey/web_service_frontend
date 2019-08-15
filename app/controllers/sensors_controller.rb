class SensorsController < ApplicationController
    include ApplicationController::UrlFor

    before_action :authenticate_user!

    def show
        @sensor = Device.find(params[:id])
    end