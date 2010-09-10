module BasePermissions::Permissions
  def self.included(base)
    base.send(:include, InstanceMethods)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def get_controllers
      controllers = nil
      require_all_controllers unless controllers
      controllers ||= ApplicationController.subclasses
    end

    private
    def require_all_controllers(path = "#{[RAILS_ROOT]}/app/controllers")
      Dir.foreach(path) do |e|
        next if e =~ /^\./
        controller_path = File.join(path, e)
        if File.directory?(controller_path)
          require_all_controllers(controller_path)
        elsif e =~ /controller.rb$/
          ApplicationController.require_or_load(controller_path)
        end
      end
    end
  end

  module InstanceMethods
  end

end

Utility.send(:include, BasePermissions::Permissions)
