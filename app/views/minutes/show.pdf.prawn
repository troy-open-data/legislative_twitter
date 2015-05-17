# PDF's built-in fonts have very limited support for internationalized text.
# If you need full UTF-8 support, consider using a TTF font instead.
#
# The following line hides this warning:
Prawn::Font::AFM.hide_m17n_warning = true

# Allows for easy use of alternate measurements, such as inches, mm, cm, etc.
require 'prawn/measurement_extensions'
require 'prawn/table'




prawn_document(
    margin: 0.5.in,
    top_margin: 1.in,
    bottom_margin: 1.in,
    background: @meeting.approved_minutes? ? nil : try(:open,'http://placehold.it/600.jpg/fff/ccc&text=Draft'),
    info: {
        Title: "#{@meeting.name} Minutes",
        Author: 'Unknown',
        Subject: 'Bill',
        Keywords: 'Troy, Bill, Code',
        Creator: 'City Clerk',
        Producer: 'Troy City Council',
        CreationDate: Time.now}) do |pdf|
  # FIXME: 508 Loop Detected, error appeared and went away without prompt
  # Error:
  #     MinutesControllerTest#test_: minutes #show should show in pdf. :
  # ActionView::Template::Error: 508 Loop Detected
  # app/views/minutes/show.pdf.prawn:18:in `_app_views_minutes_show_pdf_prawn__3636985827340667802_70303959262220'
  #   test/controllers/minutes_controller_test.rb:13:in `block (3 levels) in <class:MinutesControllerTest>'


  # paper defaults
  font_size = 12
  pdf.font_size = font_size
  pdf.font('Times-Roman')
  pdf.default_leading font_size * 0.2

  # Render agenda main text
  render 'pdf_templates/minutes',
         pdf: pdf,
         font_size: font_size,
         meeting: @meeting

  # Render page headers
  date = @meeting.date.to_formatted_s(:long)
  title = @meeting.organization.name + ' Minutes'
  title << ' (Draft)' unless @meeting.approved_minutes?
  render 'pdf_templates/header',
         pdf: pdf,
         font_size: font_size,
         right: date,
         center: title,
         approved: @meeting.approved_minutes?


end

