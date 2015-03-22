# Title
#   Numbering
pdf.text legislation.legislative_numbering, align: :center, style: :bold
pdf.move_down font_size
#   Bill Title
pdf.text "#{legislation.title.upcase}", align: :center, style: :bold
pdf.stroke_horizontal_rule
pdf.move_down font_size*2

# sanitizes and splits the body based on paragraph markers
body_paragraphs = prawnify_paragraphs(legislation.body, font_size*1.25)
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

if attach[:attachments]
  legislation.attachments.each do |attachment|
    pdf.start_new_page
    pdf.text 'ATTACHMENT FOR '+ legislation.legislative_numbering(:abbreviation),
             align: :center,
             style: :bold
  end
end