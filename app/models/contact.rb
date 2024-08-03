class Contact < ApplicationRecord

  filterrific(
    default_filter_params: { sorted_by: "created_at desc" },
    available_filters: [
      :sorted_by,
      :search_query,
      :country,
    ],
  )
  scope :sorted_by, ->(sort_key) { order(sort_key) }
  scope :this_year,-> { where('extract(year from qso_date) = ?', Time.now.year)}
  scope :in_last_month,-> { where('qso_date > ?', 1.month.ago)}

    
  def self.options_for_sorted_by
    [
      ["Name (a-z)", "name"],
      ["Created date (newest first)", "created_at desc"],
      ["Created date (oldest first)", "created_at asc"],
      ["QSO Date", "qso_date asc"],
    ]
  end
end
