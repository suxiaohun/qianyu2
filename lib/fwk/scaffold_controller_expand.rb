module Fwk
  module ScaffoldControllerExpand
    def self.included(base)
      base.class_eval do

        # 移除helper的创建
        remove_hook_for :helper


        def create_controller_files
          template_file = options.api? ? "api_controller.rb" : "controller.rb"
          template template_file, File.join("#{get_module}app/controllers", controller_class_path, "#{controller_file_name}_controller.rb")
        end

      end
    end
  end
end
