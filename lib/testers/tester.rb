module Soryo
    class Tester 

        def self.descendants
            descendants = []
            ObjectSpace.each_object(singleton_class) do |k|
                descendants.unshift k unless k == self
            end
            descendants
        end

        def initialize
        end
        
        def tester_name
            abort('Tester.tester_name should not be run directly')
        end

        def run(email, options)
            abort('Tester.run should not be called directly')
        end

    end
end
