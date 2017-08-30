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

  def test_multiplier_can_score_word_with_multiplier_and_double_letter
    scrabble = Scrabble.new

    assert_equal 18, scrabble.score_with_multipliers("hello", [1,2,1,1,1], 2)
  end

  def test_it_can_score_with_bonus
    scrabble = Scrabble.new

    assert_equal 44, scrabble.score_with_multipliers("balloon", [1,1,3,1,1,2,1], 2)
  end




end
