class ModuleGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  attr_reader :module_name, :module_path


  def initialize(*args)
    super
    full_name =  file_name.underscore
    @module_name = full_name.split('_').last
    #todo 路径后期需要扩展为启动参数配置(Rails.application.config.fwk.module_folder)
    @module_path = 'modules/' + full_name
  end

  # When a generator is invoked, each public method in the generator
  # is executed sequentially in the order that it is defined



  def create_initialize_files

    #todo 扩展根目录，注意后期同样要添加参数配置
    empty_directory 'modules' unless Dir.exist?('modules')


    empty_directory "#{module_path}"
    empty_directory "#{module_path}/app"
    empty_directory "#{module_path}/app/controllers"
    empty_directory "#{module_path}/app/helpers"
    empty_directory "#{module_path}/app/models"
    empty_directory "#{module_path}/app/views"
    empty_directory "#{module_path}/config"
    empty_directory "#{module_path}/config/initializers"
    empty_directory "#{module_path}/config/locales"
    empty_directory "#{module_path}/db"
    empty_directory "#{module_path}/db/migrate"
    empty_directory "#{module_path}/lib"
    empty_directory "#{module_path}/lib/menus"

  end


end
