require 'rails_helper'

RSpec.describe User, type: :model do 
  describe "validations" do 
    it { should validate_presence_of :username }
    it { should validate_presence_of :password_digest }
    it { should validate_presence_of :session_token }
    it { should validate_presence_of :email }
    it { should validate_length_of(:password).is_at_least(6) }
  end  
  describe "associations" do
    it { should have_many :chirps }
    it { should have_many :comments }
    it { should have_many :likes }
  end 
  describe "other methods/features" do
    # ensure session token 
    # subject(:user) { puts "😱"; User.new(email: "asdf@asdf.com", 
    #                         password: "hunter12",
    #                         username: "asdfasdf",
    #                         age: 2000) }
    # let/subject will only run if use it!
    subject(:user) { FactoryBot.build(:user, 
      password: "something_else"
    ) }

    it "assigns a custom session_token" do
      puts user.password
      expect(user.session_token).not_to be_nil
    end
    # password 

    it "does not save the password to the db" do
      user.save!
      retrieved_user = User.find(user.id)

      expect(retrieved_user.password).to be_nil
    end

    it "always passes, yes!" do 

    end 
  end

  describe "User class methods" do
    describe "User::find_by_credentials" do
      subject(:user) { FactoryBot.build(:user) }
      
      before(:each) do
        user.save!
      end
      it "fails with incorrect username" do
        expect(User.find_by_credentials("not_wisewizard", user.password)).to be_nil
      end
      it "fails with incorrect password" do
        expect(User.find_by_credentials(user.username, "coconut_water")).to be_nil
      end
      
      it "success with correct username/password" do
        expect(User.find_by_credentials(user.username, user.password)).to_not be_nil
      end
    end
  end
end