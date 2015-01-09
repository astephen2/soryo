require_relative '../email.rb'

describe Email::Command do
    before :each do 
        @command = Email::Command.new(nil)
    end
    describe '#new' do
        it 'should be of type Command' do
            expect(@command).to be_an_instance_of Email::Command
        end

        it 'should have a config attribute of type Config' do
            expect(@command.config).to be_an_instance_of Email::Config
        end

        it 'should not alter config hash if nil passed in' do
            expect(@command.config).to eq(Email::DEFAULTS)
        end

        it 'should merge in options hash if passed in' do
            options = Hash['test' => 20, 'config_test' => true]
            merged_hash = Email::DEFAULTS.merge(options)
            config2 = Email::Command.new(options)
            expect(config2.config).to eq(merged_hash)
        end

    end

end


