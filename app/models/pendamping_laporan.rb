class PendampingLaporan < ApplicationRecord
  has_many :users
  has_many :daily_reports
end
