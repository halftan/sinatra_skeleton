require_relative 'spec_helper.rb'

require_relative '../helper/app_helper.rb'

describe Helper do
  subject { Object.new.extend(Helper) }

  it { should respond_to :return_test }

  it "can return Test string" do
    expect(subject.return_test).to eq("Test")
  end
end
