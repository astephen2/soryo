require_relative '../lib/soryo.rb'

describe 'Template' do
    before :each do
        @template = Soryo::Template.new('test', 'test2')
    end

    describe '#new' do
        it "should be of type Template" do
            expect(@template).to be_an_instance_of Soryo::Template
        end

        it 'should have two strings: template and hash' do
            expect(@template.template).to eq('test')
            expect(@template.hash).to eq('test2')
        end
    end

end
