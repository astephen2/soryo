require_relative '../lib/soryo.rb'

require 'yaml'

describe Soryo::Config do
    before :each do 
        @config = Soryo::Config.new
        @invalid_filepath = 'files/invalid.file'
        @yaml_filepath = 'files/yaml.yaml'
    end

    describe '#new' do
        it 'should create instances of Config' do
            expect(@config).to be_an_instance_of Soryo::Config
        end

        it 'should be a subclass of Hash' do
            expect(@config).to be_a_kind_of Hash
        end

        it 'should be initialized with default values' do
            expect(@config).to eq(Soryo::DEFAULTS)
        end
    end

    describe '#merge_with' do
        it "should merge two hashes" do
            hash = Hash["test" => 200, "test_type" => 'test']
            merged_hashes = Soryo::DEFAULTS.merge(hash)
            expect(@config.merge_with(hash)).to eq(merged_hashes)
        end
    end

    describe '#read_yaml' do
        it "should throw an error if file is not found" do
            expect{@config.read_yaml(@invalid_filepath)}.to raise_error('NoFileFound')
        end

        it "should merge settings if file is valid" do
            @config.read_yaml(@yaml_filepath)
            yaml_hash = YAML.load(File.open(@yaml_filepath, 'r'))
            merged_hashes = Soryo::DEFAULTS.merge(yaml_hash)
            expect(@config.read_yaml(@yaml_filepath)).to eq(merged_hashes)
        end
    end
end    

