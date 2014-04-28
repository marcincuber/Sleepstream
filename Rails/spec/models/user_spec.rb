require 'spec_helper'

describe User do
  before do
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end

  subject { @user }
  
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:authenticate) }

  it { should be_valid }

  describe "remember token" do
    before { @user.save }
    its(:remember_token) { should_not be_blank }
  end

  describe "password length >= 6" do
    before do 
      @user.password = "12345"
      @user.password_confirmation = "12345"
    end
    it { should_not be_valid }
  end

  describe "uniqueness of email" do
    before { @user.save }
    it { User.new(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar").should_not be_valid }
  end
end
