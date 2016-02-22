gem "minitest"
require "minitest/autorun"

# This function returns `true` if its first argument is longer than its second,
# and `false` otherwise.
def is_longer_than?(word1, word2)
  word1.length > word2.length
end

# This function returns `true` if its argument is upper case, and `false`
# otherwise.
def is_uppercase?(word)
  word == word.upcase
end

# This function returns `true` if its argument is a palindrome, and `false`
# otherwise.
def is_palindrome?(word)
  word == word.reverse
end

# This function returns `true` if its argument starts and ends with the same
# letter, and `false` otherwise.
def starts_and_ends_with_same_letter?(word)
  word[0] == word[-1]
end

# This function returns `true` if its argument contains vowels, and `false`
# otherwise.
def has_vowels?(word)
  word.split('').any? {|l| 'aeiou'.include?(l)}
end

# This function returns the number of vowels in its argument.
def count_vowels(word)
  word.split('').count {|l| 'aeiou'.include?(l)}
end

# This function returns a new string where every vowel in its argument is
# replaced by a question mark.
def replace_vowels_with_question_mark(word)
  'aeiou'.split('').each do |l|
    word = word.gsub(l, '?')
  end

  word
end

# This function returns the longest word in a sentence.
def longest_word(sentence)
  sentence.split.sort_by {|w| w.length}[-1]
end

# This function returns an array of words which have an even number of letters.
def words_of_even_length(sentence)
  sentence.split.select {|w| w.length.even?}
end

# This funciton returns the average length of the words in a sentence.
def average_length_of_words(sentence)
  number_of_letters = sentence.gsub(' ', '').length
  number_of_words = sentence.split.length
  number_of_letters.to_f / number_of_words
end
