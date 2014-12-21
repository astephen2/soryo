require 'json'

module 'email'
    class FileInstance
        
        :attr_readable :file_path

        def initialize(file_path)
            @file_path = file_path
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

        def to_json
           JSON.parse(self.to_s)
        end
    end
end
