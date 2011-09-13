require 'maco-rb/device'
require 'maco-rb/config'
require 'minitest/spec'
require 'mocha'

module MacoRb
  describe Device do

    before(:each) do
      @paths_to_dir = paths_to_glob(*CONFIG.paths)
      @usb_dirs = CONFIG.paths.map do |d|
        [File.join(d, '00'), File.join(d, '01')]
      end.flatten
    end

    def paths_to_glob(*paths)
      paths.map{|p| File.join(p,'*') }
    end
    
    describe ".all" do

      describe " arguments" do
        it "should call Dir[] with the passed path" do
          path = CONFIG.paths.first
          Dir.expects(:[]).with(*paths_to_glob(path)).returns([])
          Device.all path
        end
        
        it "should be called with CONFIG.paths by default" do
          Dir.expects(:[]).with(*@paths_to_dir).returns(@usb_dirs)
          Device.all
        end
        
        it "might be called with an array" do
          Dir.expects(:[]).with(*@paths_to_dir).returns(@usb_dirs)
          Device.all CONFIG.paths
        end
      end

      describe "return value" do
        
        it "should return an array" do
          Device.all.must_be_instance_of Array
        end

        it "should return an array of Devices if a usb device is present" do
          Dir.expects(:[]).with(*@paths_to_dir).returns(@usb_dirs)
          Device.all.each do |d|
            d.must_be_instance_of Device
          end
        end

        it "should return one device for each dir returned by Dir" do
          Dir.expects(:[]).with(*@paths_to_dir).returns(@usb_dirs)
          Device.all.size.must_be :==, @usb_dirs.size
        end
        
      end
    end
  end
end
