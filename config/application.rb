require_relative 'boot'

require 'rails/all'

# File.expand_path("../../lib/fwk/scaffold_expand", __FILE__)
# require '../../lib/fwk/generator_expand'
# require 'lib/fwk/scaffold_expand'
#
#
#
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

# File.expand_path("../../lib/fwk/railtie", __FILE__)
require "./lib/fwk/railtie.rb"


module Rabbit
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    #


    # the default generator options
    #     api: false,
    #     assets: true,
    #     force_plural: false,
    #     helper: true,
    #     integration_tool: nil,
    #     javascripts: true,
    #     javascript_engine: :js,
    #     orm: false,
    #     resource_controller: :controller,
    #     resource_route: true,
    #     scaffold_controller: :scaffold_controller,
    #     stylesheets: true,
    #     stylesheet_engine: :css,
    #     scaffold_stylesheet: true,
    #     system_tests: nil,
    #     test_framework: nil,
    #     template_engine: :erb

    config.generators do |g|
      g.orm             :active_record
      g.template_engine :erb
      g.test_framework  nil # 禁止自动生成单元测试文件
      g.system_tests  nil # 禁止生自动成单元测试文件
      g.resource_route  false # 禁止自动生成路由
      g.helper  false # 禁止自动生成helper
      g.assets     false # 禁止自动生成assets
    end


  end
end
