module OrdersHelper
  def reader_name(order)
    if order.reader.blank?
      nil
    else
      order.reader.name
    end
  end
  def order_accepted?(order)
    if order_status == "Принята"
      true
    else
      false
    end
  end
  def order_rejected?(order)
    if order_status == "Отклонена"
      true
    else
      false
    end
  end
  def order_new?(order)
    if order_status == "Новая"
      true
    else
      false
    end
  end
end
