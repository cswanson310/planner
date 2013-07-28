module Helpers
  def login_as(user)
    session[:user_id] = user.id
  end

  #just generically login if we don't actually care about the user
  def login
    session[:user_id] = FactoryGirl.create(:user).id
  end

  def today(user)
    Day.create(date: Date.today, user_id: user.id)
  end
end
