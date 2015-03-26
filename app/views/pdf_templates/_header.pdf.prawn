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
pdf.repeat lambda{|page| page != 1} do
  pdf.text_box "#{center}", options_minutes_header
end
pdf.repeat(:all) do
  pdf.text_box "#{right}", options_date_header
end