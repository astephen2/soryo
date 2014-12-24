require_relative '../classes/fileinstance'
require 'pathname'

describe Email::FileInstance do
    before :each do
        @json_filepath = 'files/json.json'
        @yaml_filepath = 'files/yaml.yaml'
        @json_sample = Email::FileInstance.new('files/json.json')
        @yaml_sample = Email::FileInstance.new('files/yaml.yaml')
        @invalid_file = Email::FileInstance.new('files/test.invalid')
    end

    describe '#new' do
        it "should return a FileInstance object" do
            expect(@json_sample).to be_an_instance_of Email::FileInstance
        end 

        it "should have a file_path from initializer" do
            pathname = Pathname.new(@json_filepath)
            expect(@json_sample.file_path).to eq(pathname)
        end
    end

    describe '#existance?' do
        it "should return true for valid files" do
            expect(@json_sample.existance?).to be true
        end

        it "should return false for invalid files" do
            expect(@invalid_file.existance?).to be false
        end
    end

    describe '#shortname' do
        it "should return a filename without its extension" do
            expect(@json_sample.shortname).to eq('json')
        end
    end

    describe '#to_s' do
        it "should raise error if file not found" do
            expect{@invalid_file.to_s}.to raise_error('NoFileFound')
        end

        it "should return file contents if file is found" do
            file_contents = File.open(@json_filepath).read
            expect(@json_sample.to_s).to eq(file_contents)
        end
    end

    describe '#to_hash' do
        it "should raise error if no file found" do
            expect{@invalid_file.to_hash}.to raise_error('NoFileFound')
        end

        it "should read json if file is json" do
            file_contents = File.open(@json_filepath).read
            json_text = JSON.parse(file_contents)
            expect(@json_sample.to_hash).to eq(json_text)
            expect(@json_sample.to_hash).to be_an_instance_of Hash
        end

        it "should read yaml if file is yaml" do
            file_contents = File.open(@yaml_filepath).read
            yaml_text = YAML.load(file_contents)
            expect(@yaml_sample.to_hash).to eq(yaml_text)
            expect(@yaml_sample.to_hash).to be_an_instance_of Hash
        end

        it "should throw error if file is not yaml or JSON" do
            badinstance = Email::FileInstance.new('files/file.file')
            expect{badinstance.to_hash}.to raise_error('Must be a JSON or YAML file')
        end
    end

end
