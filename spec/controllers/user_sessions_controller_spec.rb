require 'spec_helper'

describe UserSessionsController do
  render_views
  let (:user) { FactoryGirl.create(:user, email: 'test') }

  it 'should redirect to current date when validation succeeds' do
    User.stubs(:authenticate).returns(true)
    post 'create', { email: user.email }
    session[:user_id].should_not be_nil
    response.should redirect_to(user_day_path(user, today(user)))
  end

  it 'should render login if they entered the wrong password' do
    User.stubs(:authenticate).returns(false)
    post 'create', { email: user.email }
    session[:user_id].should be_nil
    response.should redirect_to(new_user_session_path)
  end

  it 'should destroy current_user and redirect to login upon logout' do
    session[:user_id] = 1 #start with someone logged in
    post 'destroy'
    session[:user_id].should be_nil
    response.should redirect_to(login_path)
  end
end
