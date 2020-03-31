class Api::V1::EstatesController < Api::ApplicationController
    before_action :set_estate, only: [:show, :create, :delete]
    skip_before_action :authenticate_request, only: [:index]


    
    def index
        estates = Estate.all
        estates = estates.map do |estate|
        { id: estate.id, opis1: estate.opis1, opis2: estate.opis2, naslov: estate.naslov, posredovanje: estate.posredovanje, cena: estate.cena, telefon: estate.telefon, user_id: estate.user_id  }
      end
      
      render json: { results: estates }.to_json, status: :ok
    end

    def show
        estate = Estate.find(params[:id])
        render json: { result: estate }.to_json, status: :ok
    end

    def create
      @estate = Estate.new(estate_params)
      @estate.user = @current_api_user
  
      respond_to do |format|
        if @estate.save
          render json: { result: @estate }.to_json, status: :ok
        else
          render json: { result: @estate.errors }.to_json, status: :unprocessable_entity
        end
      end
    end

    def destroy
        estate = Estate.find(params[:id]) 
        estate.destroy
        render json: { message: "Estate was successfully destroyed." }.to_json, status: :ok

    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_estate
      @estate = Estate.find(params[:id])
    end
  end
