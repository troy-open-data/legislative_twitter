prawn_document do |pdf|
  pdf.font("Times-Roman")

  pdf.text "#{@legislation.title}", align: :center, size:18
  pdf.move_down(18)

  # sanitizes and splits the body based on paragraph markers
  body = sanitize @legislation.body, tags: %w(b strong i u strikethrough sub sup)
  body_paragraphs = body.split(/\<\/?p\>/).delete_if{|p| p.empty?}
  # outputs each paragraph
  body_paragraphs.each do |paragraph|
    pdf.text paragraph, inline_format: true
    pdf.move_down 12
  end

  # @legislation.attachments.each do |attachment|
  #   pdf.start_new_page
  #   pdf.text "#{attachment.file.original_filename}"
  # end
end