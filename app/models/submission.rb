class Submission < ApplicationRecord
  include DocumentUploader[:content]
  belongs_to :team
end
