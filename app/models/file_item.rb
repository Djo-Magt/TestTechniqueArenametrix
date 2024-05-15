class FileItem < ApplicationRecord
  has_one_attached :csv_file
  has_many :reservations, dependent: :destroy
end
