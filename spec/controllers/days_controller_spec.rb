describe DaysController do
  render_views
  let(:user) { FactoryGirl.create(:user) }

  before do
    login_as user
  end

  it 'sets user and day upon show' do
    get :show, user_id: user.id, id: today(user).id
    assigns[:day].should_not be_nil
    assigns[:user].should_not be_nil
  end
end
