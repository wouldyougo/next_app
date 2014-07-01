class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :reader, class_name: "User"

  default_scope -> { order('created_at DESC') }
  #validates :content, presence: true, length: { maximum: 140 }
  #validates :name,  presence: true, length: { maximum: 50 }, uniqueness: true
  #validates :phone, length: { minimum: 6, maximum: 11 }, allow_blank: true
  # validates :surname, presence: true, if: "name.nil?"

  # "ID агента, подключившего услугу"
  validates :user_id, presence: true
  # "ID супервайзера агента"
  #validates :reader_id, allow_blank: true
  validates :reader_id, presence: true, if: Proc.new { order_status == "Принята" }
  # Добавить validates :reader_id должен быть заполнен user_id проверяющиго со статусом reader == true

  # "ФИО абонента"
  validates :abonent, presence: true, length: { maximum: 100 }
  # "Адрес подключения"
  validates :address, presence: true, length: { maximum: 150 }
  # "Телефон домашний" и "Телефон сотовый"
  validates :phone,         allow_blank: true, length: { minimum: 6,  maximum: 11 }
  validates :phone_mobile,  allow_blank: true, length: { minimum: 10, maximum: 11 }
  # "Статус заявки: Новая / Принята / Отклонена"
  validates :order_status, presence: true, inclusion: { in: %w(Новая Принята Отклонена)}
  #validates :order_status, allow_blank: true
  # "Дата продажи"
  #validates :contract_date, allow_blank: true

  # "Предполагаемая дата подключения"
  validates :connection_date, presence: true
  #validates :connection_date, allow_blank: true
  # "Тарифный план ШПД"
  validates :inet_tariff_plan, allow_blank: true, length: { maximum: 100 }
  validates :inet_tariff_plan, presence: true, if: Proc.new { iptv_tariff_plan.blank? }
  # "Оборудование: продажа/рассрочка/аренда"
  validates :inet_device_contract, allow_blank: true, inclusion: { in: %w(Аренда Продажа Рассрочка)}
  # "Рассрочка на сколько месяцев"
  #validates :inet_installment_plan, presence: true, if: "inet_device_contract == 'Рассрочка'"
  validates :inet_installment_plan, presence: true, if: Proc.new { inet_device_contract == "Рассрочка" }
  validates :inet_installment_plan, allow_blank: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than: 36}
  # "Тарифный план IPTV"
  validates :iptv_tariff_plan, allow_blank: true, length: { maximum: 100 }
  validates :iptv_tariff_plan, presence: true, if: Proc.new { inet_tariff_plan.blank? }
  # "Оборудование: продажа/рассрочка/аренда"
  validates :iptv_device_contract, allow_blank: true, inclusion: { in: %w(Аренда Продажа Рассрочка)}
  # "Рассрочка на сколько месяцев"
  #validates :iptv_installment_plan, presence: true, if: "iptv_device_contract == 'Рассрочка'"
  validates :iptv_installment_plan, presence: true, if: Proc.new { iptv_device_contract == "Рассрочка" }
  validates :iptv_installment_plan, allow_blank: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than: 36}

  # "Дата рождения"
  #validates :date_of_birth,   allow_blank: true
  # "Место рождения"
  validates :place_of_birth,  allow_blank: true, length: { maximum: 100 }
  # "Серия паспорта"
  validates :passport_series, allow_blank: true, length: { is: 4 }, numericality: { only_integer: true }
  # "Номер паспорта"
  validates :passport_number, allow_blank: true, length: { is: 6 }, numericality: { only_integer: true }
  # "Когда выдан паспорт"
  #validates :passport_registration_date, allow_blank: true
  # "Кем выдан"
  validates :passport_issued_by, allow_blank: true, length: { maximum: 100 }

  #WillPaginate.per_page = 11
  self.per_page = 10
end
