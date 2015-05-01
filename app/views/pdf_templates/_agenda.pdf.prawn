title_width = 3.in
pdf.text_box "TROY CITY\n#{meeting.organization.name.upcase} AGENDA\nREGULAR MEETING\n#{meeting.date.to_formatted_s :long}",
             align: :center,
             style: :bold,
             width: title_width,
             at: [pdf.bounds.width/2-title_width/2 , pdf.bounds.top]
pdf.move_down font_size*8




# "Intro" Agenda Information
meeting.meeting_items.each do |item|
  pdf.text(item.title, style: :bold)  if item.title
  pdf.text(item.text)                 if item.text
end
pdf.move_down font_size

pdf.text Meeting::PROCEDURE
pdf.move_down font_size

pdf.text 'LOCAL LAW', style: :bold, align: :center
pdf.move_down font_size




# Legislations Table
meeting.grouped_motions.each do |legislation_type, motions|
  data = [[ {content: legislation_type.pluralize(motions.count).upcase, colspan: 2} ]]
  motions.each do |folio|
    legislation = folio.bill
    data << [legislation.numbering(:integer).to_s+'.', legislation.title]
  end
  pdf.table(data, header:true) do
    cells.borders = []
    column(0).width = 0.5.in
    row(0).font_style = :bold
  end
  pdf.move_down font_size*2
end