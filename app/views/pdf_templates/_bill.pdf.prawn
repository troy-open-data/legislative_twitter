# Title
#   Numbering
pdf.text bill.legislative_numbering, align: :center, style: :bold
pdf.move_down font_size
#   Bill Title
pdf.text "#{bill.title.upcase}", align: :center, style: :bold
pdf.stroke_horizontal_rule
pdf.move_down font_size*2

# sanitizes and splits the body based on paragraph markers
body_paragraphs = prawnify_paragraphs(bill.body, font_size*1.25)
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


# Start Outline
pdf.outline.define do
  section(bill.legislative_numbering, destination: 1) do
    page title: 'Bill Text', destination: 1
  end
end


# Attach Attachments
if attach[:attachments]
  bill.attachments.each do |attachment|
    pdf.start_new_page
    pdf.text 'ATTACHMENT FOR ' + bill.legislative_numbering.upcase,
             align: :center,
             style: :bold
    pdf.text file_name(attachment),
             align: :center

    attachment_width = 7.5.in
    attachment_height = 8.5.in

    pdf.bounding_box([0, attachment_height], width: attachment_width, height: attachment_height) do
      # How to display image attachments
      if /image/i =~ attachment.file.content_type
        image_path = open(attachment.file.url) rescue open(attachment.file.path)
        pdf.image image_path,
                  fit: [attachment_width, attachment_height],
                  position: :center
      #   todo: only if under page width
      else
        pdf.text attachment.file.content_type + " can't be displayed.", align: :center
      end
    end

  end
end