require_relative '../spec_helper.rb'

describe User do
  subject { User }

  it { should respond_to :create }
  it { should respond_to :authenticate }

  describe "user should have password authentication" do
    subject { User.create }

    it "holds password" do
      expect(subject).to respond_to :password
      expect(subject).to respond_to :password=
    end

    context "user already saved password" do
      subject { FactoryGirl.build :user }

      it "stores password" do
        expect(subject.save!).not_to raise_error
      end

      it "knows the right password" do
        expect(subject.password == FactoryGirl.attributes_for(:user)[:password]).to eql true
      end

      it "will reject the wrong password" do
        expect(subject.password == "wrongpassword").to eql false
      end
    end
  end
end
