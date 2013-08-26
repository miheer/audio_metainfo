class Attachment < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :audio_file
  has_attached_file :audio_file
end
