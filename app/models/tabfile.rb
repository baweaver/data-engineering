class Tabfile < ActiveRecord::Base
  attr_accessible :file_name, :parsed

  mount_uploader :file_name, DataUploader
end
