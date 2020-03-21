require 'rubygems'
require 'bundler/setup'

ENV['RACK_ENV'] ||= 'development'
APP_ROOT = File.expand_path('../', __FILE__)
ENV['BUNDLE_GEMFILE'] ||= File.join(APP_ROOT, '/', 'Gemfile')
Bundler.require(:default, ENV['RACK_ENV'].to_sym)
