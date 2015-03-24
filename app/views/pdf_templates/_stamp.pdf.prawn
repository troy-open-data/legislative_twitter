# Draft Stamp
# pdf.create_stamp('background stamp') do
#   pdf.rotate(30, :origin => [-5, -5]) do
#     pdf.fill_color 'CCCCCC'
#     pdf.font_size(256) do
#       pdf.draw_text stamp_text, :at => [1.in, 8.in]
#       pdf.draw_text stamp_text, :at => [1.in, 4.in]
#       pdf.draw_text stamp_text, :at => [1.in, 0.in]
#       pdf.draw_text stamp_text, :at => [1.in, -4.in]
#     end
#   end
# end
#
#
# pdf.repeat(:all) { pdf.stamp 'background stamp' unless approved }