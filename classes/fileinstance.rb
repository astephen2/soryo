require 'json'
require 'yaml'
require 'pathname'

class FileInstance
    
    attr_reader :file_path
    
    def initialize(file_path)
        @file_path = Pathname.new(file_path)
    end

    def to_s
        self.existance
        file = File.open(@file_path, 'r')
        file_text = file.read
        file.close
        file_text
    end

    def existance
        unless File.exists?(file_path)
            abort(file_path + "doesn't exist")
        end
    end

    def write(file_contents)
        file = File.open(@file_path, 'w')
        file.write(file_contents)
        file.close
    end

    def to_hash
        if File.extname(@file_path) == '.json'
            json_hash = JSON.parse(self.to_s)
        elsif ['.yaml', '.yml'].include? File.extname(@file_path)
            yaml_hash = YAML.load(@file_path.to_s)
        else
            abort(@file_path + 'must be a JSON or YAML file')
        end
    end

    def _symbolize(obj)
        return obj.inject({}){|memo,(k,v)| memo[k.to_sym] =  _symbolize(v); memo} if obj.is_a? Hash
        return obj.inject([]){|memo,v    | memo           << _symbolize(v); memo} if obj.is_a? Array
        return obj
    end

    def shortname
        File.basename(@file_path, '.*')
    end

end
