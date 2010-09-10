module CoreExtensions::Logger
  def self.included(base)
    base.send(:include, InstanceMethods)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def info(msg, br = true)
      msg = "  #{msg}"
      log(msg, br)
    end

    def success(msg, br = true)
      msg = "\033[44;37;5m \033[0m #{msg}"
      log(msg, br)
    end

    def warring(msg, br = true)
      msg = "\033[43;37;5m \033[0m #{msg}"
      log(msg, br)
    end

    def error(msg, br = true)
      msg = "\033[41;37;5m \033[0m #{msg}"
      log(msg, br)
    end

    private
    def log(msg, br = true)
      if br
        puts msg
      else
        print msg
      end 
    end
    
  end

  module InstanceMethods
  end
end

Logger.send(:include, CoreExtensions::Logger)
