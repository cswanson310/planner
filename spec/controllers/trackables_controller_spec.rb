describe TrackablesController do
  render_views
  let(:user) { FactoryGirl.create(:user) }
  let(:track_category) { FactoryGirl.create(:track_category) }
  let(:trackable) { FactoryGirl.build(:trackable, track_category_id: track_category.id) }

  before do
    login_as user
  end

  it 'sets track_category_id and trackable upon new' do
    get :new, track_category_id: track_category.id
    assigns[:track_category_id].should_not be_nil
    assigns[:trackable].should_not be_nil
  end

  it 'should create a valid trackable' do
    Trackable.any_instance.stubs(:valid?).returns(true)
    post :create, trackable: trackable.attributes
    # should assign the user
    assigns[:trackable].should_not be_new_record
    flash[:notice].should_not be_nil
    response.should redirect_to(user_day_path(user, today(user)))
  end

  it 'should not create an invalid trackable' do
    Trackable.any_instance.stubs(:valid?).returns(false)
    post :create, trackable: trackable.attributes
    assigns[:trackable].should be_new_record
    response.should render_template('new')
  end
end

