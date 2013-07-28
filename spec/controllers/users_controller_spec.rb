require 'spec_helper'

describe UsersController do
  render_views
  let(:user) { FactoryGirl.build(:user) }
  let(:day)  { FactoryGirl.build(:day) }

  it 'should create a valid user' do
    User.any_instance.stubs(:valid?).returns(true)
    User.any_instance.stubs(:friendly_id).returns('test')
    post 'create', user: user.attributes
    # should assign the user
    assigns[:user].should_not be_new_record
    session[:user_id].should_not be_nil
    flash[:notice].should_not be_nil
    response.should redirect_to(user_day_path(user, day))
  end

  it 'should not create an invalid user' do
    User.any_instance.stubs(:valid?).returns(false)
    post 'create', user: user.attributes
    assigns[:user].should be_new_record
    response.should render_template('new')
  end
end
