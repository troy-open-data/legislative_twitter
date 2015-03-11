module ApplicationHelper
  def diff(content1, content2)
    changes = Diffy::Diff.new(content1, content2,
                              include_plus_and_minus_in_html: true)
    changes.to_s.present? ? changes.to_s(:html).html_safe : 'No Changes'
  end
end
