class EstatesController < ApplicationController
  before_action :set_estate, only: [:show, :edit, :update, :destroy]
  before_action :can_access?, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]


  # GET /estates
  # GET /estates.json
  def index
    @estates = Estate.all
  end

  def my_estates
    @estates = Estate.where(:user_id => current_user.id)

  end

  def novogradnja
    @estates = Estate.where(vrsta: "novogradnja")
  end

  def hisa
    @estates = Estate.where(vrsta: "hisa")
  end

  def montazna
    @estates = Estate.where(vrsta: "montazna")
  end

  def pocitniski
    @estates = Estate.where(vrsta: "pocitniski")
  end

  def poslovni
    @estates = Estate.where(vrsta: "poslovni")
  end

  def search
    @estates = Estate.where(vrsta: "poslovni")
  end

  # GET /estates/1
  # GET /estates/1.json
  def show
  end

  # GET /estates/new
  def new
    @estate = Estate.new
  end

  # GET /estates/1/edit
  def edit
  end

  # POST /estates
  # POST /estates.json
  def create
    @estate = Estate.new(estate_params)
    @estate.user = current_user

    respond_to do |format|
      if @estate.save
        format.html { redirect_to @estate, notice: 'Estate was successfully created.' }
        format.json { render :show, status: :created, location: @estate }
      else
        format.html { render :new }
        format.json { render json: @estate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estates/1
  # PATCH/PUT /estates/1.json
  def update
    respond_to do |format|
      if @estate.update(estate_params)
        format.html { redirect_to @estate, notice: 'Estate was successfully updated.' }
        format.json { render :show, status: :ok, location: @estate }
      else
        format.html { render :edit }
        format.json { render json: @estate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estates/1
  # DELETE /estates/1.json
  def destroy
    @estate.destroy
    respond_to do |format|
      format.html { redirect_to estates_url, notice: 'Estate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estate
      @estate = Estate.find(params[:id])
    end

    def can_access?
      redirect_back fallback_location: root_path, alert: 'You shall not pass!' unless @estate.user == current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def estate_params
      params.require(:estate).permit(:opis1, :opis2, :naslov, :objava, :posredovanje, :vrsta, :lokacija, :telefon, :tip, :velikost, :parcela, :ime, :cena, :kraj, :user_id, images: [])
    end
end