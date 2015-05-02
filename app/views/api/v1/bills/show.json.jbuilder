json.extract! @bill, :id, :legislation_type, :title, :short_title, :created_at, :updated_at


json.preamble do
  json.recitals @bill.recitals do |recital|
    json.extract! recital, :prefix, :clause
  end
  json.enacting_formula @bill.enacting_formula
end

json.main_content do
  json.sections @bill.sections.each do |section|
    json.extract! section, :heading, :subheading
    if section.sub_sections.empty?
      json.body section.text
    else
      json.extract! section, :chapeau
      json.sub_sections section.sub_sections.each do |sub_section|
        if sub_section.paragraphs.empty?
          json.body sub_section.text
        else
          json.extract! sub_section, :chapeau
          json.paragraphs sub_section.paragraphs.each do |paragraph|
            if paragraph.sub_paragraphs.empty?
              json.body paragraph.text
            else
              json.extract! paragraph, :chapeau
              json.sub_paragraphs paragraph.sub_paragraphs.each do |sub_paragraph|
                json.body sub_paragraph.text
              end
              json.extract! paragraph, :continuation
            end
          end
          json.extract! sub_section, :continuation
        end
      end
      json.extract! section, :continuation
    end
  end
end

json.history do
  json.meetings @bill.motions do |motion|
    json.meeting do
      json.extract! motion.meeting, :id, :date_and_time
      json.organization do
        json.extract! motion.meeting.organization, :id, :name
        json.url api_v1_meeting_url(motion.meeting.organization, format: :json)
      end
      json.url api_v1_meeting_url(motion.meeting, format: :json)
    end
  end
  json.sponsors @bill.motions.collect(&:sponsors).flatten.each do |sponsor|
    json.extract! sponsor, :id, :first, :last
    json.url api_v1_person_url(sponsor, format: :json)
  end
end

json.pdf bill_url(@bill, format: :pdf)
json.bills_url api_v1_bills_url
