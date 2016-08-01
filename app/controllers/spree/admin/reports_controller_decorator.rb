Spree::Admin::ReportsController.class_eval do
  before_filter :spree_reports_setup, only: [:index]

  def orders_by_period
    (params[:completed_at_gt], params[:completed_at_lt]) = parse_date(params[:completed_at_gt],params[:completed_at_lt])
    @report = SpreeReports::Reports::OrdersByPeriod.new(params)
    respond_to do |format|
      format.html
      format.csv {
        return head :unauthorized unless SpreeReports.csv_export
        send_data @report.to_csv, filename: @report.csv_filename, type: "text/csv"
      }
    end 
  end
  
  def sold_products
    (params[:completed_at_gt], params[:completed_at_lt]) = parse_date(params[:completed_at_gt],params[:completed_at_lt])
    params[:q] ||= {}
    params[:q][:s] ||= 'quantity desc'
    @report = SpreeReports::Reports::SoldProducts.new(params)
    @search = Spree::Variant.ransack(params[:q])
    @variants = get_sold_product_variants
    respond_to do |format|
      format.html
      format.csv {
        return head :unauthorized unless SpreeReports.csv_export
        send_data @report.to_csv, filename: @report.csv_filename, type: "text/csv"
      }
    end 
  end

  protected

  def get_sold_product_variants
    Spree::Variant.with_deleted.joins(:product).order("#{Spree::Product.quoted_table_name}.name", :sku)
  end

  def spree_reports_setup
    SpreeReports.reports.each do |report|
      Spree::Admin::ReportsController.add_available_report! report
    end
  end

  private
  def parse_date(start_date, end_date)
    start_date = Time.zone.parse(start_date).beginning_of_day rescue nil
    start_date ||= Time.zone.now.beginning_of_month
    end_date = Time.zone.parse(end_date).end_of_day rescue nil
    end_date ||= Time.zone.now.end_of_day
    [start_date, end_date]
  end
  
end