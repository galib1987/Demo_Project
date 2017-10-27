require 'watir-webdriver'
require 'rspec'
require 'rspec/expectations'  # additional
require 'page_helper'
require 'require_all'
require 'rubyXL'
require 'saucelabs'
require 'nokogiri'
#require 'rubyzip'
#require 'sqlite3'
require 'active_record'
require 'active_support/all'
require 'saucelabs'
require 'rubygems'
require 'selenium-webdriver'
require 'rautomation'
require 'zip'
require 'win32ole'
require 'simplecov'
require 'simplecov-rcov'
require 'common_function'



SimpleCov.formatters = [
    SimpleCov::Formatter::HTMLFormatter,
    SimpleCov::Formatter::RcovFormatter
]

SimpleCov.start


require './lib/page_helper'
require './lib/data_helper'

require_all './lib/pages'

require_all './lib/config/data'

World PageHelper
World DataHelper
World(CF)

