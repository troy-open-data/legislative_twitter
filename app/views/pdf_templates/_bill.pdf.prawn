# Title
#   Numbering
pdf.text bill.numbering, align: :center, style: :bold
pdf.move_down font_size
#   Bill Title
pdf.text "#{bill.title.upcase}", align: :center, style: :bold
pdf.stroke_horizontal_rule
pdf.move_down font_size*2

# Preamble
bill.recitals.each do |recital|
    pdf.text "<b>#{recital.prefix.upcase}</b> #{recital.clause}", inline_format: true
  pdf.move_down font_size/2
end
pdf.move_down font_size
pdf.text "#{bill.enacting_formula.upcase}", align: :center, style: :bold
pdf.move_down font_size*2

# Sections
# TODO: Refactor out


def section_number(snum)
  "#{snum.to_s}"
end
def subsection_number(snum,ssnum)
  "#{snum.to_s}.#{ssnum.to_s}"
end
def paragraph_number(snum,ssnum,pnum)
  "#{snum.to_s}.#{ssnum.to_s}.#{pnum.to_s}"
end
def subparagraph_number(snum,ssnum,pnum,spnum)
  "#{snum.to_s}.#{ssnum.to_s}.#{pnum.to_s}.#{spnum.to_s}"
end


sec_num = 1
bill.sections.each do |section|
  data = [[]]
  num = ''
  # Section headers
  if section.heading && !section.heading.empty?
    data << [section_number(sec_num), "#{section.heading.upcase} #{section.subheading}"]
  else
    num = section_number(sec_num)
  end

  # Section content
  if section.sub_sections.empty?
    data << [num, section.text]
  else
    data << [num, section.chapeau]

    subsec_num = 1
    section.sub_sections.each do |sub_section|
      # Sub-section headings
      # Sub-section content
      if sub_section.paragraphs.empty?
        data << [subsection_number(sec_num,subsec_num), sub_section.text]
      else
        data << [subsection_number(sec_num,subsec_num), sub_section.chapeau]

        p_num = 1
        sub_section.paragraphs.each do |paragraph|
          # Paragraph headings/subheadings
          # Paragraph content
          if paragraph.sub_paragraphs.empty?
            data << [paragraph_number(sec_num,subsec_num,p_num), paragraph.text]
          else
            data << [paragraph_number(sec_num,subsec_num,p_num), paragraph.chapeau]

            sp_num = 1
            paragraph.sub_paragraphs.each do |sub_paragraph|
              # Sub-paragraph content
              data << [subparagraph_number(sec_num,subsec_num,p_num,sp_num), sub_paragraph.text]
              sp_num += 1
            end

            data << ['', paragraph.continuation]
            p_num += 1
          end
        end
        data << ['', sub_section.continuation]
        subsec_num += 1
      end
    end
    data << ['', section.continuation]
  end


  pdf.table(data, header:true) do
    cells.borders = []
    column(0).width = 1.in
    column(0).style align: :right
  end
  sec_num += 1
  pdf.move_down font_size*2
end


# Signature Block
pdf.move_down font_size*2
pdf.bounding_box([0, pdf.cursor], :width => 3.5.in) do
  pdf.text "Approved as to form, #{Date.today.strftime("%B %-d, %Y")}"
  pdf.move_down font_size*3
  pdf.stroke_horizontal_rule
  pdf.move_down font_size*0.3
  legal_name = 'Ian H. Silverman, Esq.'
  legal_title = ', Corporation Counsel'
  pdf.formatted_text [ { text: legal_name, styles: [:bold, :italic] },
                       { text: legal_title } ]
end


# Start Outline
pdf.outline.define do
  section(bill.numbering, destination: 1) do
    page title: 'Bill Text', destination: 1
  end
end


# Attach Attachments
if attach[:attachments]
  bill.attachments.each do |attachment|
    pdf.start_new_page
    pdf.text 'ATTACHMENT FOR ' + bill.numbering.upcase,
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