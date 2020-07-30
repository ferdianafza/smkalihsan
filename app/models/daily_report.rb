class DailyReport < ApplicationRecord
  belongs_to :user
  belongs_to :major
  belongs_to :pendamping_laporan
  has_many_attached :documentations, dependent: :destroy
  # validates :documentations, presence: true, blob: { content_type: :image }

  def self.to_csv
    attributes = %w{Tanggal Nama Kelas  Pendamping_Laporan Subuh Dhuha Tadarus Keterangan }

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |report|
        # csv << attributes.map{ |attr| report.send(attr) }
        csv << [report.tanggal,User.find(report.user_id).firstname + " " +User.find(report.user_id).lastname ,
                          Major.find(report.major_id).name, report.pendamping_laporan.name,
                          report.subuh, report.dhuha, report.tadarus, report.keterangan]
      end
    end
  end

end
