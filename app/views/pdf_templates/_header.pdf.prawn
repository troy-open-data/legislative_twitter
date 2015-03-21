# Draft Stamp
pdf.create_stamp('Draft') do
  pdf.rotate(30, :origin => [-5, -5]) do
    pdf.fill_color 'CCCCCC'
    pdf.font_size(256) do
      pdf.draw_text 'Draft', :at => [1.in, 8.in]
      pdf.draw_text 'Draft', :at => [1.in, 4.in]
      pdf.draw_text 'Draft', :at => [1.in, 0.in]
      pdf.draw_text 'Draft', :at => [1.in, -4.in]
    end
  end
end




# Page Numbers and Headers
header_widths = 3.in
options_page_number = { at: [pdf.bounds.left , pdf.bounds.top+font_size*2],
                        width: header_widths,
                        align: :left,
                        start_count_at: 1 }
options_minutes_header = { at: [pdf.bounds.width/2-header_widths/2 , pdf.bounds.top+font_size*2],
                           width: header_widths,
                           align: :center,
                           style: :italic }
options_date_header = { at: [pdf.bounds.right-header_widths, pdf.bounds.top+font_size*2],
                        width: header_widths,
                        align: :right, }

pdf.number_pages 'Page <page> of <total>', options_page_number
pdf.repeat(:all) do
  pdf.text_box "#{right}", options_date_header
  pdf.stamp 'Draft' unless approved
end
pdf.repeat lambda{|page| page != 1} do
  pdf.text_box "#{center}", options_minutes_header
end