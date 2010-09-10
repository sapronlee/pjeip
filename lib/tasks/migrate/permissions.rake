namespace :migrate do 
  desc "添加所有的Controller和Action到数据库"
  task :permissions => :environment do
    controllers = Utility.get_controllers
    controllers.each do |controller|
      controller_class = controller.constantize
      controller_class.action_methods.each do |action|
        if Permission.by_controller_action(controller_class.controller_path, action).empty?
          unless Enum::EXCEPT_ACTION.include? action
            Permission.create(:controller_name => controller_class.controller_path,
                              :action_name => action,
                              :name => "#{controller_class.controller_path}/#{action}")
          end
        end
      end
    end 
  end
end
