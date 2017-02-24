class Photo < ApplicationRecord
  belongs_to :user


  attr_accessor :photo_file

end
#
# return unless image_file = self.image_file
# file_path = image_file.tempfile.path
# md5 = Digest::MD5.file(file_path).to_s
# if found= Image.find_by(md5: md5)
#   self.image = found
# else
#   self.image = Image.create!(
#       md5: md5,
#       filename: image_file.original_filename,
#       file_size: image_file.size,
#       image: image_file
#   )
# end
