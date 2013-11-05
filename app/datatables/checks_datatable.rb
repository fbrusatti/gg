class ChecksDatatable
  include ApplicationHelper
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Check.count,
      iTotalDisplayRecords: checks.total_entries,
      aaData: data
    }
  end

private

  def data
    checks.map do |check|
      [
        link_to(check.check_number, check),
        h(check.account),
        h(check.emisor),
        h(check.bank.complete_name),
        print_date_time(check.emission_date, :date_and_time),
        print_date_time(check.payment_date, :date_and_time),
        h(check.check_status)
      ]
    end
  end

  def checks
    @checks ||= fetch_checks
  end

  def fetch_checks
    checks = Check.order("#{sort_column} #{sort_direction}")
    checks = checks.page(page).per_page(per_page)
    if params[:sSearch].present?
      checks = checks.where("check_number ilike :search or account ilike :search
        or emisor ilike :search" , search: "%#{params[:sSearch]}%")
    end
    if params[:sSearch_3].present?
      checks = checks.where(:bank_id =>params[:sSearch_3])
    end

    if params[:sSearch_4].present?
      time = params[:sSearch_4].split(" ")
      checks = checks.where('emission_date BETWEEN ? AND ?',
                              (Time.zone.parse(time.first)).beginning_of_day.to_s(:db),
                                (Time.zone.parse(time.last)).end_of_day.to_s(:db))
    end
    if params[:sSearch_5].present?
      time = params[:sSearch_5].split(" ")
      checks = checks.where('payment_date BETWEEN ? AND ?',
                               (Time.zone.parse(time.first)).beginning_of_day.to_s(:db),
                                (Time.zone.parse(time.last)).end_of_day.to_s(:db))
    end
    if params[:sSearch_6].present?
      checks = checks.where(:check_status =>params[:sSearch_6])
    end
    checks
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[check_number account emisor bank_id emission_date payment_date check_status]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end