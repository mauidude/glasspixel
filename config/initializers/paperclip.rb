Paperclip::Attachment.default_options.update({
  :path => "/public/uploads/:class/:attachment/:hash/:style.:extension",
  :hash_secret => "75dbad28f3d038e5412ee8fe8fe82a83"
})