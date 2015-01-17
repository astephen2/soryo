require_relative '../lib/soryo.rb'

describe Soryo::Command do
    before :each do 
        @command = Soryo::Command.new(nil)
    end
    describe '#new' do
        it 'should be of type Command' do
            expect(@command).to be_an_instance_of Soryo::Command
        end

        it 'should have a config attribute of type Config' do
            expect(@command.config).to be_an_instance_of Soryo::Config
        end

        it 'should not alter config hash if nil passed in' do
            expect(@command.config).to eq(Soryo::DEFAULTS)
        end

        it 'should merge in options hash if passed in' do
            options = Hash['test' => 20, 'config_test' => true]
            merged_hash = Soryo::DEFAULTS.merge(options)
            config2 = Soryo::Command.new(options)
            expect(config2.config).to eq(merged_hash)
        end

    end

end


