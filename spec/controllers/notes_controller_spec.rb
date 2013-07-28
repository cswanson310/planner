describe NotesController do
  render_views
  let(:user) { FactoryGirl.create(:user) }
  let(:note) { FactoryGirl.build(:note) }

  before do
    login_as user
    Day.create(user_id: user.id, date: Date.today)
  end

  it 'sets note upon new' do
    get :new, note: note.attributes
    assigns[:note].should_not be_nil
  end

  it 'should create a valid note' do
    Note.any_instance.stubs(:valid?).returns(true)
    post :create, note: note.attributes
    assigns[:note].should_not be_new_record
    flash[:notice].should_not be_nil
    response.should redirect_to(user_day_path(user, today(user)))
  end

  it 'should not create an invalid note' do
    Note.any_instance.stubs(:valid?).returns(false)
    post :create, note: note.attributes
    assigns[:note].should be_new_record
    response.should render_template('new')
  end
end


