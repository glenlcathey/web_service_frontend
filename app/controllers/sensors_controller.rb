class SensorsController < ApplicationController
    include ApplicationController::UrlFor

    before_action :authenticate_user!

    def show
        @device = Device.find(params[:id])
    end