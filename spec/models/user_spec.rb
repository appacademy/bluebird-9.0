require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { FactoryBot.build(:user) }

  describe "validations" do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:session_token) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_uniqueness_of(:session_token) }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  describe 'associations' do
    it { should have_many :chirps }
  end

  describe 'session token' do
    it 'assigns a session token if none is given' do
      harry = User.new(FactoryBot.attributes_for(:harry_potter, session_token: nil))
      expect(harry.session_token).not_to be_nil
    end
  end

  describe 'password encryption' do
    it 'does not save passwords to the database' do
      subject.save!
      expect(User.find(subject.id).password).to be_nil
    end

    it 'encrypts the passwords using BCrypt' do
      password = 'password'
      subject # instantiate before setting expectation in case #password= gets called
      expect(BCrypt::Password).to receive(:create).with(password)
      subject.password = password
    end
  end
end
