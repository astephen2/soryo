module Soryo
    class Plugin

        # Used for finding all necessary plugins
        def self.descendants
            descendants = []
            ObjectSpace.each_object(singleton_class) do |k|
                descendants.unshift k unless k == self
            end
            descendants
        end

        def run(contents)
            abort_string = '#{self.class} does not have a run method'
            abort(abort_string)
        end

    end
end
