# Title
title_width = 3.in
pdf.text_box "TROY CITY\n#{@meeting.organization.name.upcase} MINUTES\nREGULAR MEETING\n#{@meeting.date.to_formatted_s :long}",
             align: :center,
             style: :bold,
             width: title_width,
             at: [pdf.bounds.width/2-title_width/2 , pdf.bounds.top]
pdf.move_down font_size*8


# Attendance
pdf.text 'ATTENDANCE', align: :center, style: :bold
attendance = list_attendees(@meeting)
pdf.text attendance, align: :center
pdf.move_down font_size*2


# "Intro" Minutes Information
meeting.meeting_items.each do |item|
  pdf.text(item.title, style: :bold)  if item.title
  pdf.text(item.text)                 if item.text
end
pdf.move_down font_size

pdf.text Meeting::PROCEDURE
pdf.move_down font_size

pdf.text 'LOCAL LAW', style: :bold, align: :center
pdf.move_down font_size

# Motions Table
@meeting.grouped_motions.each do |type, motions|
  data = [[ {content: type.pluralize(motions.count).upcase, colspan: 3} ]]
  motions.each do |motion|
    data << [motion.bill.numbering(:integer).to_s+'.', {content:motion.bill.title, colspan: 2}]
    data << ['','Sponsor(s)', motion.sponsors_list]
    data << ['','Notes', motion.notes]
    motions.roll_calls.each do |roll_call|
      data << ['',"#{roll_call.type} Vote (yea-nay-abstain)", print_votes(roll_call)]
    end
    2.times { data << ['','',''] }
  end
  pdf.table(data, header:true) do
    cells.borders = []
    column(0).width = 0.5.in
    column(1).width = 1.in
    row(0).font_style = :bold
    row(0).style align: :center
  end
  pdf.move_down font_size*2
end