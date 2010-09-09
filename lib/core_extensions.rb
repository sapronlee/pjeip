module CoreExtensions
  Dir["#{RAILS_ROOT}/lib/core_extensions/*.rb"].each do |f|
    require_dependency f
  end
end
Object.instance_eval { include CoreExtensions }  
