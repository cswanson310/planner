require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.build(:user) }

  describe 'validations' do
    it 'fails if passwords do not match' do
      user.new_password = 'test-pwd'
      user.new_password_confirmation = 'test-pwd-with-typo'
      user.save.should be_false
      user.errors.messages[:new_password_confirmation].should_not be_nil
    end

    it 'fails if email has been taken' do
      #just create another one to confilct with user
      FactoryGirl.create(:user, email: 'test')
      user.email = 'test'
      user.save.should be_false
      user.errors.messages[:email].should_not be_nil
    end

  end

  it 'assigns correct friendly_ids' do
    name_opts = { first_name: "John", last_name: "Smith" }
    users = (1..4).map do |i|
      FactoryGirl.create(:user, name_opts.merge(email: "test#{i}"))
    end
    users.first.friendly_id.should == 'john'
    users[1].friendly_id.should == 'john-smith'
    users[2].friendly_id.should == 'john_smith'
    users[3].friendly_id.should == 'john_smith_1'
  end

  it 'does not store the actual password' do
    user.save
    expect { user.password }.to raise_error(NoMethodError)
    user.reload.new_password.should be_nil
    user.reload.new_password_confirmation.should be_nil
    user.hashed_password.should_not be_nil
  end
end
