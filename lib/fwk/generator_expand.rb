module Fwk
  module GeneratorExpand
    def self.included(base)
      base.class_eval do
        class_option :module, type: :string, default: '',
                     desc: "自定义的模块参数"

        # 获取传递过来的参数判断是否含有module
        def get_module
          if options[:module].present?
            #todo 后期要追加启动参数判定

            module_arr = {:fwk=>'01_fwk',:mdm=>'10_mdm',:cmi=>'20_cmi'}

            full_name = module_arr[options[:module].to_sym]

            if full_name
              "modules/#{full_name}/"
            else
              ''
            end
          else
            ''
          end

        end
      end
    end


  end
end