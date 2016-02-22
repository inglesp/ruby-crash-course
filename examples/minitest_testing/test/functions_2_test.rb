require 'minitest/autorun'
require 'functions_2'

class FunctionsTests < Minitest::Test
  def test_is_longer_than?
    assert_equal(false, is_longer_than?("fish", "fingers"))
    assert_equal(true, is_longer_than?("fingers", "fish"))
    assert_equal(false, is_longer_than?("fish", "fish"))
  end

  def test_is_uppercase?
    assert_equal(true, is_uppercase?("HELLO"))
    assert_equal(false, is_uppercase?("hello"))
    assert_equal(false, is_uppercase?("HeLlO"))
  end

  def test_is_palindrome?
    assert_equal(true, is_palindrome?("rotator"))
    assert_equal(false, is_palindrome?("curator"))
  end

  def test_starts_and_ends_with_same_letter?
    assert_equal(true, starts_and_ends_with_same_letter?("rotator"))
    assert_equal(true, starts_and_ends_with_same_letter?("regulator"))
    assert_equal(false, starts_and_ends_with_same_letter?("rotated"))
  end

  def test_has_vowels
    assert_equal(false, has_vowels?('rhythms'))
    assert_equal(true, has_vowels?('eunoia'))
  end

  def test_count_vowels
    assert_equal(2, count_vowels('vowel'))
    assert_equal(3, count_vowels('consonant'))
    assert_equal(0, count_vowels('rhythms'))
  end

  def test_replace_vowels_with_question_mark
    assert_equal("??n???", replace_vowels_with_question_mark("eunoia"))
  end

  def test_longest_word
    assert_equal("households", longest_word("two households both alike in dignity"))
    assert_equal("question", longest_word("to be or not to be that is the question"))
  end

  def test_words_of_even_length
    assert_equal(
      ["households", "both", "in"],
      words_of_even_length("two households both alike in dignity")
    )
    assert_equal(
      ["to", "be", "or", "to", "be", "that", "is", "question"],
      words_of_even_length("to be or not to be that is the question")
    )
  end

  def test_average_length_of_words
    assert_equal(5 + 1.0 / 6, average_length_of_words("two households both alike in dignity"))
    assert_equal(3.0, average_length_of_words("to be or not to be that is the question"))
  end
end
