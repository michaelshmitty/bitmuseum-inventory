module ApplicationHelper
  def fa_icon(names = "flag", original_options = {})
    options = original_options.deep_dup
    classes = ["fas"]
    classes.concat icon_names(names)
    classes.concat Array(options.delete(:class))
    text = options.delete(:text)
    right_icon = options.delete(:right)
    icon = content_tag(:i, nil, options.merge(:class => classes))
    icon_join(icon, text, right_icon)
  end

  def badge_state(state)
    case state
    when :unknown
      "badge-secondary"
    when "working"
      "badge-success"
    when "needs_cleaning"
      "badge-info"
    when "needs_repair"
      "badge-warning"
    when "broken"
      "badge-danger"
    else
      "badge-secondary"
    end
  end


  private

  def icon_join(icon, text, reverse_order = false)
    return icon if text.blank?
    elements = [icon, ERB::Util.html_escape(text)]
    elements.reverse! if reverse_order
    safe_join(elements, " ")
  end

  def icon_names(names = [])
    array_value(names).map { |n| "fa-#{n}" }
  end

  def array_value(value = [])
    value.is_a?(Array) ? value : value.to_s.split(/\s+/)
  end
end
