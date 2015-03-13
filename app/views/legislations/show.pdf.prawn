# PDF's built-in fonts have very limited support for internationalized text.
# If you need full UTF-8 support, consider using a TTF font instead.
#
# The following line hides this warning:
Prawn::Font::AFM.hide_m17n_warning = true

# Allows for easy use of alternate measurements, such as inches, mm, cm, etc.
require "prawn/measurement_extensions"

prawn_document(
    margin: 1.in,
    bottom_margin:1.5.in,
    info: {
        Title: @legislation.title,
        Author: 'Unknown',
        Subject: 'Legislation',
        Keywords: 'Troy, Legislation, Code',
        Creator: 'City Clerk',
        Producer: 'Troy City Council',
        CreationDate: Time.now}) do |pdf|

  # paper defaults
  font_size = 12
  pdf.font_size = font_size
  pdf.font("Times-Roman")
  pdf.default_leading font_size*0.5

  # page title
  pdf.move_down(font_size*6)
  pdf.text "#{@legislation.title}", align: :center, size: font_size*1.5
  pdf.move_down(font_size*4)

  # sanitizes and splits the body based on paragraph markers
  body_paragraphs = prawnify_paragraphs(@legislation.body, font_size*1.25)
  # outputs each paragraph
  body_paragraphs.each do |paragraph|
    pdf.text paragraph, inline_format: true
    pdf.move_down font_size
  end

  # page numbers on alternating sides
  pdf.repeat(:even, :dynamic => true) do
    pdf.draw_text (pdf.page_number.to_s), at: [0.in, -0.5.in]
  end
  pdf.repeat(:odd, :dynamic => true) do
    pdf.draw_text (pdf.page_number.to_s), at: [6.5.in, -0.5.in]
  end

  # @legislation.attachments.each do |attachment|
  #   pdf.start_new_page
  #   pdf.text "#{attachment.file.original_filename}"
  # end
end