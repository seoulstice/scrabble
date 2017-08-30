gem 'minitest'
require './lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_exists
    scrabble = Scrabble.new

    assert_instance_of Scrabble, scrabble
  end

  def test_it_can_score_a_single_letter
    scrabble = Scrabble.new

    assert_equal 1, scrabble.score("a")
    assert_equal 4, scrabble.score("f")
  end

  def test_it_can_score_a_word
    scrabble = Scrabble.new

    assert_equal 8, scrabble.score("hello")
  end

  def test_multiplier_can_score_word
    scrabble = Scrabble.new

    assert_equal 9, scrabble.score_with_multipliers("hello", [1,2,1,1,1])
  end

  


end
