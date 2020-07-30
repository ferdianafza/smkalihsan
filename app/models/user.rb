class User < ApplicationRecord
  has_many :daily_reports, dependent: :destroy
  belongs_to :major
  belongs_to :pendamping_laporan
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
