class DailyReportsController < ApplicationController
  before_action :set_daily_report, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index, :new, :show, :edit, :update, :destroy]

  # GET /daily_reports
  # GET /daily_reports.json
  def index
    @daily_reports = DailyReport.all
    @daily_reports = current_user.daily_reports.order(created_at: :desc)
      respond_to do |format|
        format.html
        format.json { render json: @daily_reports }
        format.pdf do
          pdf = ReportRamadhansPdf.new(@daily_reports)
          send_data pdf.render,
              filename: "Laporan Harian #{@daily_reports.first.user.firstname} #{@daily_reports.first.user.lastname}.pdf"
          end
        end
  end

  # GET /daily_reports/1
  # GET /daily_reports/1.json
  def show
  end

  # GET /daily_reports/new
  def new
    @daily_report = DailyReport.new
  end

  # GET /daily_reports/1/edit
  def edit
  end

  # POST /daily_reports
  # POST /daily_reports.json
  def create
    @daily_report = DailyReport.new(daily_report_params)

    respond_to do |format|
      if @daily_report.save
        format.html { redirect_to '/daily_reports/new', notice: 'Laporan Harian Berhasil dikirim.' }
        format.json { render :show, status: :created, location: @daily_report }
      else
        format.html { redirect_to '/daily_reports/new', notice: 'Laporan Harian Gagal Dikirim, Mohon Periksa Bagian Yang Belum Diisi.' }
        format.json { render json: @daily_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /daily_reports/1
  # PATCH/PUT /daily_reports/1.json
  def update
    respond_to do |format|
      if @daily_report.update(daily_report_params)
        format.html { redirect_to @daily_report, notice: 'Daily report was successfully updated.' }
        format.json { render :show, status: :ok, location: @daily_report }
      else
        format.html { render :edit }
        format.json { render json: @daily_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daily_reports/1
  # DELETE /daily_reports/1.json
  def destroy
    @daily_report.destroy
    respond_to do |format|
      format.html { redirect_to daily_reports_url, notice: 'Daily report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daily_report
      @daily_report = DailyReport.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def daily_report_params
      params.require(:daily_report).permit(:subuh, :dhuha, :tadarus, :keterangan, :user_id, :major_id, :pendamping_laporan_id, :tanggal, documentations: [])
    end
end
