class DocumentUploader < Shrine

  Attacher.validate do
    validate_max_size 2.megabytes, message: 'is too large (max is 2 MB)'
    validate_mime_type_inclusion ['application/pdf'], message: 'Only .pdf allowed'
  end

end
