module MacoRb
  class Device

    attr_reader :file

    def initialize(dir)
      @file = dir
    end

    
    
    class << self

      def all *paths
        paths = CONFIG.paths if paths.empty?
        paths = paths.flatten.map{|p| File.join(p,'*') }
        Dir[*paths].map{|dir| Device.new(dir) }
      end
    end
  end
end
