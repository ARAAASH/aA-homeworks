require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email)}
    # it { should validate_presence_of(:password_digest)}
    it { should validate_length_of(:password).is_at_least(6) }
    it do 
      should validate_presence_of(:password_digest).
      with_message("Password can\'t be blank.")
    end
    # it 'should validate length of password to be greater than six'
  end
end
