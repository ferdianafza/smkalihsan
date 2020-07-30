class PendampingLaporansController < ApplicationController
  before_action :set_pendamping_laporan, only: [:show, :edit, :update, :destroy]

  # GET /pendamping_laporans
  # GET /pendamping_laporans.json
  def index
    @pendamping_laporans = PendampingLaporan.all
  end

  # GET /pendamping_laporans/1
  # GET /pendamping_laporans/1.json
  def show
  end

  # GET /pendamping_laporans/new
  def new
    @pendamping_laporan = PendampingLaporan.new
  end

  # GET /pendamping_laporans/1/edit
  def edit
  end

  # POST /pendamping_laporans
  # POST /pendamping_laporans.json
  def create
    @pendamping_laporan = PendampingLaporan.new(pendamping_laporan_params)

    respond_to do |format|
      if @pendamping_laporan.save
        format.html { redirect_to @pendamping_laporan, notice: 'Pendamping laporan was successfully created.' }
        format.json { render :show, status: :created, location: @pendamping_laporan }
      else
        format.html { render :new }
        format.json { render json: @pendamping_laporan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pendamping_laporans/1
  # PATCH/PUT /pendamping_laporans/1.json
  def update
    respond_to do |format|
      if @pendamping_laporan.update(pendamping_laporan_params)
        format.html { redirect_to @pendamping_laporan, notice: 'Pendamping laporan was successfully updated.' }
        format.json { render :show, status: :ok, location: @pendamping_laporan }
      else
        format.html { render :edit }
        format.json { render json: @pendamping_laporan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pendamping_laporans/1
  # DELETE /pendamping_laporans/1.json
  def destroy
    @pendamping_laporan.destroy
    respond_to do |format|
      format.html { redirect_to pendamping_laporans_url, notice: 'Pendamping laporan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pendamping_laporan
      @pendamping_laporan = PendampingLaporan.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pendamping_laporan_params
      params.require(:pendamping_laporan).permit(:name)
    end
end
