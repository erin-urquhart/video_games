class VideoGame < ApplicationRecord
  belongs_to :employee
  belongs_to :platform
end
