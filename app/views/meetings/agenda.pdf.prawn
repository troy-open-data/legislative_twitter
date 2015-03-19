# PDF's built-in fonts have very limited support for internationalized text.
# If you need full UTF-8 support, consider using a TTF font instead.
#
# The following line hides this warning:
Prawn::Font::AFM.hide_m17n_warning = true

# Allows for easy use of alternate measurements, such as inches, mm, cm, etc.
require "prawn/measurement_extensions"
require "prawn/table"

prawn_document(
    margin: 0.5.in,
    top_margin: 1.in,
    bottom_margin: 1.in,
    info: {
        Title: "#{@meeting.date.to_s} #{@meeting.organization.name} Agenda",
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
  # pdf.text "Agenda: #{@meeting.organization.name}, #{@meeting.date}", align: :center, style: :bold
  # pdf.stroke_horizontal_rule
  # pdf.move_down font_size*2

  title_width = 3.in
  pdf.text_box "TROY CITY\n#{@meeting.organization.name.upcase} AGENDA\nREGULAR MEETING\n#{@meeting.date}",
               align: :center,
               style: :bold,
               width: title_width,
               at: [pdf.bounds.width/2-title_width/2 , pdf.bounds.top]
  pdf.move_down font_size*8

  # pdf.text"Pledge of Allegiance\nRoll Call\nGood News Agenda\nVacancy List"
  # pdf.move_down font_size
  #
  # pdf.text
  # pdf.move_down font_size
  #
  # pdf.text , style: :bold
  # pdf.move_down font_size

  data = [["Pledge of Allegiance\nRoll Call\nGood News Agenda\nVacancy List"],
  ["Pursuant to Section 2.72-2 entitled \"Public Forum\" of the Special Rules ofOrder of the Troy City Council a period of time shall be designated during each regular or special meeting of the City Council as a public forum during which citizens of the City shall be permitted to address the Council on legislation on that meeting's agenda and on any subject appropriate to the conduct ofTroy City government. Length of time allotted for citizen comment shall be no longer than five (5) minutes per speaker. At the completion of the agenda, citizen's comment shall be no longer than five (5) minutes per speaker appropriate to any subject to the conduct of Troy City government."],
  ["\nLOCAL LAW"]]
  pdf.table(data) do
    cells.borders = []
    # row(1).font_style = :italic
    row(2).font_style = :bold
  end

  pdf.move_down font_size

  # Legislations Table
  @meeting.grouped_legislations.each do |legislation_type, legislations|
    data = [[ {content: legislation_type.pluralize(legislations.count).upcase, colspan: 2} ]]
      legislations.each do |legislation|
        data << [legislation.legislative_numbering(:integer).to_s+'.', legislation.title]
      end
    pdf.table(data, header:true) do
      cells.borders = []
      column(0).width = 0.5.in
      row(0).font_style = :bold
    end
    pdf.move_down font_size*2
  end

  # Page for each legislation
  # @meeting.legislations.each do |legislation|
  #   pdf.start_new_page
  #   pdf.text legislation.legislative_numbering(:abbreviation), style: :bold, align: :center
  #   pdf.move_down font_size
  #   pdf.text legislation.title.upcase, style: :bold, align: :center
  #   pdf.stroke_horizontal_rule
  # end


  pdf.create_stamp("Draft") do
    pdf.rotate(30, :origin => [-5, -5]) do
      pdf.fill_color "CCCCCC"
      pdf.font_size(256) do
        pdf.draw_text "Draft", :at => [1.in, 8.in]
        pdf.draw_text "Draft", :at => [1.in, 4.in]
        pdf.draw_text "Draft", :at => [1.in, 0.in]
        pdf.draw_text "Draft", :at => [1.in, -4.in]
      end
    end
  end




  # Page Numbers and Headers
  # page numbers at top
  header_widths = 3.in
  options_page_number = { at: [pdf.bounds.left , pdf.bounds.top+font_size*2],
                          width: header_widths,
                          align: :left,
                          start_count_at: 1 }
  options_agenda_header = { at: [pdf.bounds.width/2-header_widths/2 , pdf.bounds.top+font_size*2],
                            width: header_widths,
                            align: :center,
                            style: :italic }
  options_date_header = { at: [pdf.bounds.right-header_widths, pdf.bounds.top+font_size*2],
                                 width: header_widths,
                                 align: :right, }

  pdf.number_pages "Page <page> of <total>", options_page_number
  pdf.repeat(:all) do
    pdf.text_box "#{@meeting.date.to_s}", options_date_header
    pdf.stamp "Draft"
  end
  pdf.repeat lambda{|page| page != 1} do
    pdf.text_box "#{@meeting.organization.name} Agenda", options_agenda_header
  end
end

