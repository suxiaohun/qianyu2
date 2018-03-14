module Fwk
  module RouteExpand
    def self.included(base)
      base.class_eval do


        def add_resource_route
          return if options[:actions].present?

          # iterates over all namespaces and opens up blocks
          regular_class_path.each_with_index do |namespace, index|
            write("scope module:  :#{namespace} do", index + 1)
          end

          # inserts the primary resource
          write("resources :#{file_name.pluralize}", route_length + 1)

          # ends blocks
          regular_class_path.each_index do |index|
            write("end", route_length - index)
          end

          # route prepends two spaces onto the front of the string that is passed, this corrects that.
          # Also it adds a \n to the end of each line, as route already adds that
          # we need to correct that too.
          route route_string[2..-2]
        end



      end
    end


  end
end