module CoreExtensions
  def require_core_extensions
    Dir["#{RAILS_ROOT}/lib/core_exensions/*.rb"].each do |f|
      require_dependency f
    end
  end
end
Object.instance_eval { include CoreExtensions }  