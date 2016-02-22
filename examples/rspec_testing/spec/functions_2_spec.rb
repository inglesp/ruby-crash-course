require 'rspec'
require 'functions_2'

describe "is_longer_than?" do
  it "is false when the first argument is shorter than the second" do
    expect(is_longer_than?("fish", "fingers")).to be false
  end

  it "is true when the first argument is longer than the second" do
    expect(is_longer_than?("fingers", "fish")).to be true
  end

  it "is false when the two arguments are the same length" do
    expect(is_longer_than?("fish", "fish")).to be false
  end
end

describe "is_uppercase?" do
  it "is true when all the characters are uppercase" do
    expect(is_uppercase?("HELLO")).to be true
  end

  it "is false when all the characters are lowercase" do
    expect(is_uppercase?("hello")).to be false
  end

  it "is false when only some of the characters are uppercase" do
    expect(is_uppercase?("HeLlO")).to be false
  end
end

describe "is_palindrome?" do
  it "is true when the word is a palindrome" do
    expect(is_palindrome?("rotator")).to be true
  end

  it "is false when the word is not a palindrome" do
    expect(is_palindrome?("curator")).to be false
  end
end

describe "starts_and_ends_with_same_letter?" do
  it "is true when the word starts and ends with the same letter" do
    expect(starts_and_ends_with_same_letter?("rotator")).to be true
    expect(starts_and_ends_with_same_letter?("regulator")).to be true
  end

  it "is not true when the word doesn't start and end with the same letter" do
    expect(starts_and_ends_with_same_letter?("rotated")).to be false
  end
end

describe "has_vowels?" do
  it "is true when the word has vowels" do
    expect(has_vowels?('eunoia')).to be true
  end

  it "is not true when the word has only consonants" do
    expect(has_vowels?('rhythms')).to be false
  end
end

describe "count_vowels" do
  it "is 2 when the word has 2 vowels" do
    expect(count_vowels('vowel')).to eq(2)
  end

  it "is 3 when the word has 3 vowels" do
    expect(count_vowels('consonant')).to eq(3)
  end

  it "is 0 when the word doesn't have any vowels" do
    expect(count_vowels('rhythms')).to eq(0)
  end
end

describe "replace_vowels_with_question_mark" do
  it "replaces all the vowels with a question mark" do
    expect(replace_vowels_with_question_mark("eunoia")).to eq("??n???")
  end
end

describe "longest_word" do
  it "returns the longest word in a sentence" do
    expect(longest_word("two households both alike in dignity")).to eq("households")
    expect(longest_word("to be or not to be that is the question")).to eq("question")
  end
end

describe "words_of_even_length" do
  it "returns all the words with the same length from a sentence" do
    expect(words_of_even_length("two households both alike in dignity")).to eq(["households", "both", "in"])
    expect(words_of_even_length("to be or not to be that is the question")).to eq(%w(to be or to be that is question))
  end
end

describe "average_length_of_words" do
  it "return the average length of all the words in a sentence" do
    expect(average_length_of_words("two households both alike in dignity")).to eq(5 + 1.0 / 6)
    expect(average_length_of_words("to be or not to be that is the question")).to eq(3.0)
  end
end
