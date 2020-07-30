class DailyReportsPdf < Prawn::Document
require 'prawn'
require 'open-uri'
require 'uri'
  include Rails.application.routes.url_helpers
  def initialize(daily_reports)
    super()
    @daily_reports = daily_reports
    daily_reports
    my_daily_reports
  end

  def daily_reports
    text "Lapoan harian #{@daily_reports.user_id.firstname}"
  end

  def nama
    @daily_reports.map do |report|
      User.find(report.user_id).firstname
    end
  end

  def my_daily_reports
    text "JURNAL KEGIATAN HARIAN SISWA",
                                      :align => :center,
                                      :size => 18,
                                      :styles => [:bold]
    text "SMK AL-IHSAN BATUJAJAR",
                                      :align => :center,
                                      :size => 18,
                                      :styles => [:bold]
    text "TAHUN AJARAN 2020/2021",
                                      :align => :center,
                                      :size => 18,
                                      :styles => [:bold]
    text "Nama: #{@daily_reports.map do |report|
      User.find(report.user_id).firstname
    end} Kelas: #{@daily_reports.map do |report|
      report.major.name
    end} Pendamping Laporan: #{@daily_reports.map do |report|
      report.pendamping_laporan.name
    end} "



    table daily_reports_rows do
      row(0).font_style = :bold
      # columns(1..2).align = :right
      self.row_colors = ["DDDDDD", "FFFFFF"]
      self.header = true
    end

    # move_down 20

    # table report_ramadhans_rows_fardhu do
    #   self.row_colors = ["DDDDDD", "FFFFFF"]
    #   self.header = true
    # end

    # move_down 20

    # table report_ramadhans_rows_sunah do
    #   self.row_colors = ["DDDDDD", "FFFFFF"]
    #   self.header = true
    # end
  end

  def daily_reports_rows
    [["Tanggal", "Nama","Subuh", "Tadarus", "Dhuha", "Keterangan", "Dokumentasi"]] +
    @daily_reports.map do |report|
      [report.tanggal.to_s, User.find(report.user_id).firstname + User.find(report.user_id).lastname, report.subuh.to_s, report.tadarus.to_s, report.dhuha.to_s,
       report.keterangan.to_s, {:image => URI.open(report.documentations.first.service_url), :fit => [100, 200] }]
    end
  end

  # def report_ramadhans_rows_fardhu
  #   text "Amalan Fardhu"
  #   [["Tanggal","Nama", "Subuh", "Dzuhu", "Ashar", "Magrib", "Isya"]] +
  #   @report_ramadhans.map do |report|
  #     [report.tanggal.to_s,Student.find(report.student_id).firstname + Student.find(report.student_id).lastname, report.subuh, report.dzuhur, report.ashar,
  #      report.magrib, report.isya]
  #   end
  # end

  # def report_ramadhans_rows_sunah
  #   text "Amalan Sunah"
  #   [["Tanggal","Nama","Duha", "Tahajud", "Taubat", "Hajat"]] +
  #   @report_ramadhans.map do |report|
  #     [report.tanggal.to_s,Student.find(report.student_id).firstname + Student.find(report.student_id).lastname, report.duha, report.tahajud, report.taubat,
  #      report.hajat]
  #   end
  # end

  # def images
  #   image open(@daily_reports.first.files.first.service_url)
  # {:image => URI.open(report.files.first.service_url)}
  # end

end