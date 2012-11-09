require 'test_helper'

class UserTest < ActiveSupport::TestCase
  fixtures :users

  test "can't save without a name and email" do
    @user = User.create :name => 'Snoopy'
    assert !@user.save, "We need an email to save."

    @user.email = 'snoopy@luvbox.com'
    assert @user.save
  end

  test "user names are titleized" do
    @user = User.create :name => 'ivan tam'
    assert_equal 'Ivan Tam', @user.name
  end

end
