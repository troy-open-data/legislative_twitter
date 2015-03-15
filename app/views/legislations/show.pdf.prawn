# PDF's built-in fonts have very limited support for internationalized text.
# If you need full UTF-8 support, consider using a TTF font instead.
#
# The following line hides this warning:
Prawn::Font::AFM.hide_m17n_warning = true

# Allows for easy use of alternate measurements, such as inches, mm, cm, etc.
require "prawn/measurement_extensions"

prawn_document(
    margin: 0.5.in,
    top_margin: 1.in,
    bottom_margin: 1.in,
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
  pdf.default_leading font_size*0.2

  # page title
  # pdf.move_down font_size*2
  pdf.text "#{@legislation.title.upcase}", align: :center, style: :bold
  pdf.stroke_horizontal_rule
  pdf.move_down font_size*2

  # sanitizes and splits the body based on paragraph markers
  body_paragraphs = prawnify_paragraphs(@legislation.body, font_size*1.25)
  # outputs each paragraph
  body_paragraphs.each do |paragraph|
    pdf.text paragraph, inline_format: true
    pdf.move_down font_size
  end

  # Signature Block
  pdf.move_down font_size*2
  pdf.bounding_box([0, pdf.cursor], :width => 3.5.in) do
    pdf.text "Approved as to form, #{Date.today.strftime("%B %-d, %Y")}"
    pdf.move_down font_size*3
    pdf.stroke_horizontal_rule
    pdf.move_down font_size*0.3
    legal_name = "Ian H. Silverman, Esq."
    legal_title = ", Corporation Counsel"
    pdf.formatted_text [ { text: legal_name, styles: [:bold, :italic] },
                         { text: legal_title } ]
  end

  # page numbers at top
  header_widths = 2.5.in
  options_page_number = { at: [pdf.bounds.left , pdf.bounds.top+font_size*2],
                          width: header_widths,
                          align: :left,
                          start_count_at: 1 }
  options_legislative_number = { at: [pdf.bounds.right-header_widths, pdf.bounds.top+font_size*2],
                                 width: header_widths,
                                 align: :right,
                                 style: :bold }

  pdf.number_pages "Page <page> of <total>", options_page_number
  pdf.repeat(:all) do
    pdf.text_box @legislation.legislative_numbering(:abbreviation), options_legislative_number
  end
end