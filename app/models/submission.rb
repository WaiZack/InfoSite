class Submission < ApplicationRecord
  include DocumentUploader[:content]
end
