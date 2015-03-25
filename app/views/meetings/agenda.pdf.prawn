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

  # Render agenda main text
  render 'pdf_templates/agenda',
         pdf: pdf,
         font_size: font_size,
         meeting: @meeting

  # Render each legislation
  if @attach[:legislation]
    @meeting.grouped_legislations.each do |group, legislations|
      legislations.each do |legislation|
        pdf.start_new_page
        render 'pdf_templates/legislation',
               pdf: pdf,
               font_size: font_size,
               legislation: legislation,
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

