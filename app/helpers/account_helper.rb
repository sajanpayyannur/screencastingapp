module AccountHelper
  def transaction_status_tag(status)
    case status
    when Transaction.pending then content_tag(:span, "Pending")
    when Transaction.canceled then content_tag(:span, "Canceled", :class => 'red')
    when Transaction.effected then content_tag(:span, "Effected", :class => 'green')
    end
  end
end
