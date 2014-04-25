require File.expand_path('../boot', __FILE__)

require 'bundler'
require 'active_support'
require 'active_support/core_ext/hash/keys'

module MarsHobbit
  def self.env
    @_env ||= ActiveSupport::StringInquirer.new(ENV['RACK_ENV'] || 'development')
  end

  def self.root
    File.dirname(ENV['BUNDLE_GEMFILE'])
  end
end

Bundler.require(:default, MarsHobbit.env)
