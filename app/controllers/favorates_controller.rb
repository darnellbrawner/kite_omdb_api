class FavoratesController < ApplicationController
  before_action :set_favorate, only: [:show, :edit, :update, :destroy]

  # GET /favorates
  # GET /favorates.json
  def index
    @favorates = Favorate.all
  end

  # GET /favorates/1
  # GET /favorates/1.json
  def show
  end

  # GET /favorates/new
  def new
    @favorate = Favorate.new
  end

  # GET /favorates/1/edit
  def edit
  end

  # POST /favorates/toggle
  def toggle
    @favorate = Favorate.where(imdb_id:params[:id]).first
    @favorate.nil? ?  Favorate.new(imdb_id:params[:id]).save : @favorate.destroy
    respond_to do |format|
      format.html { redirect_to favorates_url, notice: 'Favorate was successfully toggled.' }
      format.json { head :no_content }
      format.js
    end
  end

  # POST /favorates
  # POST /favorates.json
  def create
    @favorate = Favorate.new(favorate_params)

    respond_to do |format|
      if @favorate.save
        format.html { redirect_to @favorate, notice: 'Favorate was successfully created.' }
        format.json { render :show, status: :created, location: @favorate }
      else
        format.html { render :new }
        format.json { render json: @favorate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /favorates/1
  # PATCH/PUT /favorates/1.json
  def update
    respond_to do |format|
      if @favorate.update(favorate_params)
        format.html { redirect_to @favorate, notice: 'Favorate was successfully updated.' }
        format.json { render :show, status: :ok, location: @favorate }
      else
        format.html { render :edit }
        format.json { render json: @favorate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favorates/1
  # DELETE /favorates/1.json
  def destroy
    @favorate.destroy
    respond_to do |format|
      format.html { redirect_to favorates_url, notice: 'Favorate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorate
      #@favorate = Favorate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def favorate_params
      params.require(:favorate).permit(:imdb_id)
    end
end
