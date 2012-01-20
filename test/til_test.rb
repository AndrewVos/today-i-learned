require "minitest/pride"
require "minitest/unit"
require "minitest/autorun"
require_relative "../lib/til"
class TilTest < MiniTest::Unit::TestCase

  def test_persists_a_value
    til = Til.create(value: "monkeys")
    til.save
    
    assert_equal "monkeys", Til.all.first.value
  end
     

end
