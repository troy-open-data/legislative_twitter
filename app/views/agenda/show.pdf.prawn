# PDF's built-in fonts have very limited support for internationalized text.
# If you need full UTF-8 support, consider using a TTF font instead.
#
# The following line hides this warning:
Prawn::Font::AFM.hide_m17n_warning = true

# Allows for easy use of alternate measurements, such as inches, mm, cm, etc.
require "prawn/measurement_extensions"
require "prawn/table"
require 'open-uri'



prawn_document(
    margin: 0.5.in,
    top_margin: 1.in,
    bottom_margin: 1.in,
    background: @meeting.approved_agenda? ? nil : open('http://placehold.it/600.jpg/fff/ccc&text=Draft'),
    info: {
        Title: "#{@meeting.name} Agenda",
        Author: 'Unknown',
        Subject: 'Bill',
        Keywords: 'Troy, Bill, Code',
        Creator: 'City Clerk',
        Producer: 'Troy City Council',
        CreationDate: Time.now}) do |pdf|

  # paper defaults
  font_size = 12
  pdf.font_size = font_size
  pdf.font('Times-Roman')
  pdf.default_leading font_size*0.2

  # Render agenda main text
  render 'pdf_templates/agenda',
         pdf: pdf,
         font_size: font_size,
         meeting: @meeting

  # Render each bill
  if @attach[:bill]
    @meeting.grouped_motions.each do |group, folios|
      folios.each do |folio|
        legislation = folio.bill
        pdf.start_new_page
        render 'pdf_templates/bill',
               pdf: pdf,
               font_size: font_size,
               bill: legislation,
               attach: @attach
      end
    end
  end

  # Render page headers
  date = @meeting.date.to_formatted_s(:long)
  title = @meeting.organization.name + ' Agenda'
  title << ' (Draft)' unless @meeting.approved_agenda?
  render 'pdf_templates/header',
         pdf: pdf,
         font_size: font_size,
         right: date,
         center: title,
         approved: @meeting.approved_agenda?

end

