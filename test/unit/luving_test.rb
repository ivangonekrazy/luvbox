require 'test_helper'

class LuvingTest < ActiveSupport::TestCase
  fixtures :users

  def setup
    @ivan = User.find_by_name 'Ivan'
    @alana = User.find_by_name 'Alana'
    @chico = User.find_by_name 'Chico'
  end

  test "sending luv" do
    @ivan.give_luv_to @chico, "Good boy!"
    @ivan.give_luv_to @chico, "Who's a good dog?!"
    @alana.give_luv_to @chico

    assert_equal 2, @ivan.luvs_to(@chico).count
    assert_equal 2, @chico.luvs_from(@ivan).count
    assert_equal 1, @chico.luvs_from(@alana).count

    assert_equal 1, @alana.luvs_given
    assert_equal 2, @ivan.luvs_given
    assert_equal 3, @chico.luvs_received

    assert_equal "Good boy!", @ivan.luvs_to(@chico).first.comment

    assert_equal @ivan.luvs_to(@chico).count, @chico.luvs_from(@ivan).count
  end

  test "counting luvs" do
    @ivan.give_luv_to @chico

    assert_equal 1, @ivan.luvs_given
    assert_equal 1, @chico.luvs_received
  end

end
