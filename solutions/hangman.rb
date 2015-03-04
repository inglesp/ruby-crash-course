def choose_word
  contents = File.read(File.join('..', 'data', 'english-word-list'))
  words = contents.split
  words[rand(words.size)].upcase
end

def get_lives
  while true
    puts "How many lives would you like?"

    lives = gets.chomp.to_i
    if lives > 0
      break
    end
  end

  lives
end

def player_has_lives_left(lives)
  return lives > 0
end

def display_concealed_word(word, guesses)
  characters = []
  letters = word.split("")

  letters.each do |l|
    if guesses.include?(l)
      characters.push(l)
    else
      characters.push("?")
    end
  end

  puts characters.join(" ")
end

def get_guess
  while true do
    puts "Enter a letter"

    guess = gets.chomp
    if guess.size == 1 && "ABCDEFGHIJKLMNOPQRSTUVWXYZ".include?(guess.upcase)
      break
    end

    puts "Not a valid letter!"
  end

  guess.upcase
end

def guess_is_correct?(word, guess)
  word.include?(guess)
end

def word_is_guessed?(word, guesses)
  letters = word.split("")
  letters.all? {|l| guesses.include?(l)}
end

def subtract_life(lives)
  lives - 1
end

def already_guessed?(guess, guesses)
  guesses.include?(guess)
end

def tell_player_guess_is_correct
  puts "Correct!"
end

def tell_player_guess_is_incorrect(lives)
  if lives == 1
    puts "Incorrect!  You have 1 life left."
  else
    puts "Incorrect!  You have #{lives} lives left."
  end
end

def tell_player_they_have_won(lives)
  if lives == 1
    puts "Well done!  You won with 1 life left."
  else
    puts "Well done!  You won with #{lives} lives left."
  end
end

def tell_player_they_have_lost(word)
  puts "Bad luck!  The word was #{word}."
end

def tell_player_already_guessed(guess)
  puts "You have already guessed #{guess}."
end

def play
  word = choose_word
  lives = get_lives
  guesses = []

  while player_has_lives_left(lives)
    display_concealed_word(word, guesses)
    guess = get_guess

    if already_guessed?(guess, guesses)
      tell_player_already_guessed(guess)
      next
    end

    guesses.push(guess)

    if guess_is_correct?(word, guess)
      tell_player_guess_is_correct
      if word_is_guessed?(word, guesses)
        break
      end
    else
      lives = subtract_life(lives)
      tell_player_guess_is_incorrect(lives)
    end
  end

  if player_has_lives_left(lives)
    tell_player_they_have_won(lives)
  else
    tell_player_they_have_lost(word)
  end
end

play
