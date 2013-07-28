describe TrackCategoriesController do
  render_views
  let(:user) { FactoryGirl.create(:user) }
  let(:track_category) { FactoryGirl.build(:track_category) }

  before do
    login_as user
  end

  it 'sets track_category upon new' do
    get :new
    assigns[:track_category].should_not be_nil
  end

  it 'should create a valid track_category' do
    TrackCategory.any_instance.stubs(:valid?).returns(true)
    post :create, track_category: track_category.attributes
    # should assign the user
    assigns[:track_category].should_not be_new_record
    flash[:notice].should_not be_nil
  end

  it 'redirects to new trackable path and sets trackable_id' do
    post :create, track_category: track_category.attributes
    # hmm, so track_category isn't saved yet, so doesn't have an ID
    # assuming it's the first, this should work
    # TODO: make this work without assuming 1st id
    response.should redirect_to(new_trackable_path(track_category_id: 1))
  end

  it 'should not create an invalid track_category' do
    TrackCategory.any_instance.stubs(:valid?).returns(false)
    post 'create', track_category: track_category.attributes
    assigns[:track_category].should be_new_record
    response.should render_template('new')
  end
end


