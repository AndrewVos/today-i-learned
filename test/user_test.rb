require_relative 'test_helper'
require_relative '../lib/user'

class UserTest < MiniTest::Unit::TestCase
  def setup
    User.delete_all
  end

  def test_saves_name
    User.create name: "Vos"
    user = User.first

    assert_equal "Vos", user.name
  end

  def test_saves_tils
    User.create(name: "Vos", tils: [Til.new(value: "TIL")])
    til = User.first.tils.first
    assert_equal "TIL", til.value
  end

  def test_usernames_are_unique
    User.create(name: "Vos")
    saved = User.create(name: "Vos")
    assert 1, User.all.size
  end
end
