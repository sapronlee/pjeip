module BasePermissions
  Dir["#{RAILS_ROOT}/lib/base_permissions/*.rb"].each do |f|
    require_dependency f
  end
end
Object.instance_eval { include BasePermissions }  
