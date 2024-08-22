module ApplicationHelper
  def active_class(link_path)
    current_page?(link_path) ? 'active' : ''
  end

  def format_to_indonesian_currency(amount)
    number_to_currency(amount, unit: 'Rp ', separator: ',', delimiter: '.', precision: 2)
  end

  def formatted_date(date)
    date.strftime('%d %B %Y - %H:%M %p')
  end
end
