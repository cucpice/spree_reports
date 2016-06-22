require 'spree_core'
require "spree_reports/engine"
require "chartkick"
require "groupdate"

module SpreeReports
  
  # list of visible reports
  mattr_accessor :reports
  
  # time zone
  mattr_accessor :time_zone
  
  # start of week
  mattr_accessor :week_start
  
  # export
  mattr_accessor :csv_export
  
  # available months to select in reports
  mattr_accessor :report_months
  
  # default months selection in reports
  mattr_accessor :default_months
  
  # check if the api user has this role
  mattr_accessor :api_user_role
  
  # date formats for different group_by settings
  mattr_accessor :date_formats
  
  # these user roles are exluded from all reports
  mattr_accessor :excluded_roles
  
  # these user accounts are exluded from all reports
  mattr_accessor :excluded_users

  # This is for set up the currency format in the report
  mattr_accessor :money_format
   
end

# default configuration, overrideable in config/initializer spree_reports.rb

SpreeReports.reports = [
  :orders_by_period,
  :sold_products
]

SpreeReports.time_zone = "Pacific Time (US & Canada)"
SpreeReports.week_start = :mon
SpreeReports.csv_export = true
SpreeReports.report_months = %w{1 3 6 12 24 36 48 all}
SpreeReports.default_months = 6
SpreeReports.api_user_role = "admin"
SpreeReports.date_formats = {
  year: "%Y",
  month: "%m.%Y",
  week: "%W/%Y",
  day: "%m.%d.%y"
}
SpreeReports.excluded_roles = %w{admin}
SpreeReports.excluded_users = []

SpreeReports.money_format = {}