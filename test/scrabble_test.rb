gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  skip
  def test_it_exists
    scrabble = Scrabble.new
  end


  def test_it_can_score_a_single_letter
    skip
    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end

  def test_it_splits_word_into_array
    scrabble = Scrabble.new("hello")
    assert_equal ["h", "e", "l", "l", "o"], scrabble.score
  end
end
