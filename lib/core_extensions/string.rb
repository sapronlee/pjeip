module CoreExtensions::String
  def self.included(base)
    base.send(:include, InstanceMethods)
    base.extend(ClassMethods)
  end

  module ClassMethods
    
  end

  module InstanceMethods
    #字符串转换布尔
    def to_bool
     ActiveRecord::ConnectionAdapters::Column.value_to_boolean(self) 
    end
  end
end

String.send(:include, CoreExtensions::String)
