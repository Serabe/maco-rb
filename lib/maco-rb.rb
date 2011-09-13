MACO_DIR = File.join(File.dirname(__FILE__), 'maco-rb')

def MACO_DIR.for(dir)
  File.join(self, dir)
end

require MACO_DIR.for('config')
require MACO_DIR.for('device')
require MACO_DIR.for('version')

module MacoRb

end
