require 'rubygems'

require 'dry_plugin_test_helper'

PluginTestEnvironment.initialize_environment(File.dirname(__FILE__), :rails_version => '2.3.3')

require 'mocha'

class Shape < ActiveRecord::Base
  has_properties :in => :data
end

class Rectangle < Shape
  property :width, :integer
  property :height, :integer
end

class Circle < Shape
  property :radius, :integer
end
