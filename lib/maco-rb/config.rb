require 'singleton'
module MacoRb
  class Config
    include Singleton
    
    DEFAULT_LOOKUP_PATHS = ['/proc/bus/usb', '/dev/bus/usb']

    def paths
      @paths || DEFAULT_LOOKUP_PATHS
    end
  end

  CONFIG = Config.instance
end
