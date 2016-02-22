---
title: A Ruby Crash Course
layout: main
---

# A Ruby Crash Course

Last updated: February 2016

* Peter Inglesby, peter.inglesby@gmail.com
* Chris Parsons, chris@thinkcodelearn.com

Framework Training


### About the course

These notes accompany a two day training course, delivered at the Ordnance Survey in March 2015.  The course is a short crash course.  By the end of the course, you will be familiar with the fundamentals of the Ruby programming language. You will have written several programs in Ruby, including simple games and programs to extract data from websites and databases.

The course will be as interactive as possible, and I hope that you will ask as many questions as you need to.  These notes are not meant to be comprehensive, but cover the main points we'll discuss during the course (although we might not have time to cover absolutely everything in the notes).
 
These notes are available online at http://inglesp.github.io/ruby-crash-course, and you will receive a PDF copy after the course.


### Code samples for the course

Most of the code samples in these notes, as well as code for the exercises, are available from https://github.com/inglesp/ruby-crash-course/archive/master.zip.  Solutions will be made available at the end of the course!


### Running Ruby: Interacting with Ruby via IRB

IRB is the Interactive RuBy shell.  We can use it for trying out Ruby commands, to see what they do and to help us understand how Ruby works.

Start it from the command line by typing "irb".  You should see something like this:

    $ irb
    1.9.3-p385 :001 >

We can type Ruby "expressions" into IRB.  Ruby will evaluate the expression, and IRB will display the result.

As a very basic example, we can use IRB as a calculator.  This is what an IRB session might look like:

    1.9.3-p385 :001 > 10 + 20
     => 30
    1.9.3-p385 :002 > (10 + 20) * (11 + 21)
     => 960
    1.9.3-p385 :003 > 10 + 20 * 11 + 21
     => 251

To quite IRB, type `exit`.

Things like `10 + 20` and `(10 + 20) * (11 + 21)` are Ruby expressions, and `30` and `960` are the values that result from evaluating those expressions.

> Task: Here is a list of several more Ruby expressions.  Working in pairs, type each expression into IRB, and make sure you understand why you get the result.

    20 - 10
    20 + -10
    20 - +10
    20 - -10
    100 / 5
    100 / 6
    100.0 / 6
    100 / 6.0
    2 ** 3
    3 ** 2
    4 % 3
    5 % 3
    6 % 3
    20
    20.class
    n = 10
    n
    n + 1
    n = n + 1
    n
    n += 1
    n
    m = 8
    n + m
    m > n
    n > m
    m < n
    n > m
    m >= 8
    m == 8
    m == 9
    m
    p = 11
    q = p
    p = 13
    p
    q
    name = "Kate"
    name[0]
    name[1]
    name[4]
    name[-1]
    name[-2]
    name[0..2]
    name[0...2]
    "Hello, #{name}!"
    name.reverse
    "Kate".reverse
    name.upcase
    name.downcase
    name.size
    name.include?("a")
    name.include?("A")
    "Kate".class
    "  Kate    ".strip
    "Kate".strip
    list = [1, 3, 5, 7, 9]
    list.size
    list.reverse
    list[0]
    list[-1]
    list[100]
    list.map {|n| n + 1}
    list
    list.map {|n| n + n}
    list.include?(11)
    list << 11
    list
    list.include?(11)
    list.select {|n| n < 8}
    list.any? {|n| n > 8}
    list.any? {|n| n > 12}
    list.all? {|n| n < 8}
    list.all? {|n| n < 12}
    list.class

We'll talk more about what we've seen here shortly, but first we should talk about what happens when things go wrong.  There are two kinds of errors: syntactic errors, and semantic errors.

A syntactic error occurs when you give Ruby something to evaluate that it cannot parse.  Some examples of syntax errors in English might be:

    John kicked the.
    John kicked ball the.
    John kicked theball.

If we give Ruby something syntactically invalid to evaluate, Ruby will complain.  Type each of the following into IRB, and try to understand the output:

    1 *** 3
    2 * 10)
    [1, 2, 3 4]

A semantic error occurs when you give Ruby a syntactically valid expression to evaluate, but for some reason Ruby does not know how to evaluate it.  In English, the phrase "John kicked the ball" is syntactically valid, but it might be semantically wrong, if there's no ball, or if John's asleep, or if there are two people called John, or if the ball's on the other side of a fence, or...

The following expressions all give semantic errors.  Again, type each of them into IRB, and try to understand the output:

    "abc" + 123
    123 + "abc"
    123.reverse
    xxx + 123
    123 / 0
    [1, 2, 3].include?()

As you've seen, when Ruby encounters an error, it'll display information about that error, which we can use to help us work out what we're doing wrong.

Let's now look in more detail at some of the concepts we've encountered.


### Building blocks: Values

In Ruby, a value is something like `5`, or `"Kate"`, or `true`, or `[1, 2, 3]`.  A value has a class:

    > 5.class
     => Fixnum
    > 5.0.class
     => Float
    > "Kate".class
     => String
    > [1, 2, 3].class
     => Array

A value's class indicates what kind of thing it is, which in turn determines what you can do with it.  For instance, you can reverse a `String` or an `Array`, but you can't reverse a `Fixnum`.  (What would it even mean to reverse the number 5?)

    > "Kate".reverse
     => "etaK"
    > 5.reverse
    NoMethodError: undefined method `reverse' for 5:Fixnum


### Building blocks: Expressions

An expression is a combination of values, and operations on those values, that can be "evaluated" to produce a single value.  Additonally, a single value is a Ruby expression that evaluates to itself.

Some of the expressions we've seen include familiar mathematical operations like addition and subtraction.  These are called "infix" operations, because the symbol for the operation comes in between its arguments:

    > 1 + 2
     => 3

Another very common operation compares its arguments:

    > 10 == 10
     => true
    > 10 == 11
     => false
    > 10 != 11
     => true

In other expressions we've seen, the operations are invoked by "calling a method" on a value.  In the following example, we say that we're calling the `reverse` method on the value `"Kate"`.

    > "Kate".reverse
     => "etaK"

A method might "take some arguments".  For instance, in the following example, the `include?` method takes a single argument, `"K"`:

    > "Kate".include?("K")
     => true

If a method takes arguments, the arguments are usually enclosed in parentheses, but this is not always required:

    > "Kate".include? "K"
     => true

For clarity, I usually do include the parentheses, but you'll often come across code that doesn't.

Methods can be chained together to produce more complicated expressions.  For instance:

    > "Kate".reverse.upcase.start_with?("K")
     => false

### Building blocks: Names (AKA "Variables")

When programming, it's very useful to give names to values.  We can then refer to the value by a name that we've given it, rather than by referring to the value itself.  That's what we're doing here:

    > x = 100
     => 100
    > x * 20
     => 2000

This is useful, because it lets us perform compuations without caring about what values we're performing the compuations on.  For instance, there's a formula we can use to calculate the amount we need to pay per month to keep up payments on a mortage.  For this, we need to know the principal (the amount borrowed), the monthly interest rate, and the number of monthly payments.

    > principal = 150_000
     => 150000 
    > monthly_interest_rate = 3.79 / 100 / 12
     => 0.0031583333333333337 
    > num_monthly_payments = 30 * 12
     => 360 
    > monthly_repayment = (monthly_interest_rate * principal) / (1 - (1 + monthly_interest_rate) ** (-num_monthly_payments))
     => 698.0824025649966 

If we want to calculate the monthly repayments required over a different term, we can change the value that `num_monthly_payments` refers to, and re-run the calculation:

    > num_monthly_payments = 20 * 12
     => 240 
    > monthly_repayment = (monthly_interest_rate * principal) / (1 - (1 + monthly_interest_rate) ** (-num_monthly_payments))
     => 892.458132546533 
    > num_monthly_payments = 10 * 12
     => 120 
    > monthly_repayment = (monthly_interest_rate * principal) / (1 - (1 + monthly_interest_rate) ** (-num_monthly_payments))
     => 1503.7514157212502 


Given a name, we can change the value it refers to:

    > x = 10
     => 10
    > x = 11
     => 11

We can also give two names to a single value:

    > x = 10
     => 10
    > y = 10
     => 10
    > x == y
     => true

Having done this, if we change the value that `y` refers to, the value that `x` refers to will not change:

    > y = 11
     => 11
    > x
     => 10
    > x == y
     => false

It's important to note that the name we use to refer to a value does not matter to Ruby.  As far as Ruby is concerned, we could just use the names `x1`, `x2`, `x3`, `x4`, and so on, (or `banana`, `apple`, `pear`...) but it's important to choose names that communicate something to a person reading your code.

Note that you'll often hear names referred to as "variables".  This is quite correct, but it's often unclear whether when somebody says "the variable x" they mean "the name x" or "the value referred to by the name x".


### Running Ruby: Running Ruby programs

It's really useful to be able to interact with Ruby via IRB, but if we ever want to repeat our computations, we'll need to write a program, and run the program many times.  To do this, we can store our code in a file.

In the `examples` directory, create a file called `hello.rb`.  Open the file with a text editor such as notepad++ or gEdit, and type the following into the file:

    # examples/hello.rb
    puts "What's your name?"
    name = gets.chomp
    puts "Hello, #{name}!"

Save the file, then from the command line, navigate to the `examples` directory.  Now at the command line, type `ruby hello.rb`.  You should see something like:

    $ ruby hello.rb
    What's your name?
    Peter
    Hello, Peter!

This will run the code in `hello.rb`, executing the code line by line:

 * The first line is a comment, and is for human consumption.  It is ignored by Ruby.  In this case, the comment just tells us the name of the file containing the program.
 * The second line displays `What's your name?` on the screen.  `puts` is short for "put string".
 * The third line gets a string from the user, truncates any trailing whitespace, and assigns the name `name` to it.
 * The fourth line interpolates the value of `name` into the string `"Hello, #{name}"`, and then displays this on the screen.

> Question: Why does the second line need to truncate trailing whitespace from the input?


### Building blocks: Making decisions

A computer program needs to be able to make decisions based on its input.  That is, it needs to be able to do different things depending on the value of some expression.

The usual way of doing that in Ruby is with an `if` statement.  A simple `if` statement will look like this:

    if <condition>
      <do something>
    else
      <do something else>
    end

Note the indentation: this is not important to Ruby, but it helps people who are reading your code to understand its structure.

The condition of an `if` statement can be any Ruby expression, but it will usually be one that evaluates to either `true` or `false`.  Remember that we have seen this kind of expression before.  For instance, the value of `x < y` will be `true` if the value of `x` is less than the value of `y`.

Create a new file in your `examples` directory, and call it `if.rb`.  Type the following into the file:

    # examples/if.rb
    x = 10
    y = 20

    if x < y
      puts "#{x} is less than #{y}"
    else
      puts "#{y} is less than #{x}"
    end

Before you run the program, think about what you would expect to see.  Now run the program.  Were you right?

The `else` part of an `if` statement is not necessary.  Sometimes you might only want to do something if a condition is `true`, and nothing otherwise.  So you could have:

    if x < y
      puts "#{x} is less than #{y}"
    end

Additionally, an `if` statement can have more than two conditions.  What would you expect this code to do?

    x = 10
    y = 20

    if x < y - 20
      puts "#{x} is a lot less than #{y}"
    elsif x < y
      puts "#{x} is a little less than #{y}"
    elsif y < x - 20
      puts "#{y} is a lot less than #{x}"
    elsif x < y
      puts "#{y} is a little less than #{x}"
    else
      puts "#{x} is equal to #{y}"
    end

We often want to test combinations of conditions.  For instance, we might want to check whether one numerical value is between two other values.  We can combine conditions with the operators `||` and `&&`.

    if (0 < x) && (x < 100)
      puts "#{x} is between 0 and 100"
    end

    if (x < 0) || (x > 100)
      puts "#{x} is either less than 0 or greater than 100"
    end

We can also reverse a condition with the `!` operator.

    if !(x < 0)
      puts "#{x} is not less than 0"
    end

> Exercise: In the directory `exercises/syntax-errors`, there are several files called `if_xx.rb`.  Each of these contains a syntax error.  Find the errors, and fix them.


### Running Ruby: Getting user input

We've seen that we can use `gets` to get a string from the user.  What does the following program do?

    # examples/adder.rb
    puts "What is your first number?"
    x = gets.chomp

    puts "What is your second number?"
    y = gets.chomp

    puts "#{x} + #{y} = #{x + y}"

> Question: Can you explain what you've seen here?

The problem is that `gets` gives a string, and when we give the `+` operator a pair of strings, it concatenates them together.  Fortunately, it's very easy to convert a string to an integer:

    > "10".to_i
     => 10
    > "10".to_i + "20".to_i
     => 30

> Exercise: Fix `adder.rb` so that it converts the user's input to integers.
>
> Question:  What happens if you call `.to_i` on a string that does not represent a number?  Do you think that's helpful behaviour?


## Building blocks: Looping

It's very common to need to do something many times.

    # examples/nine_times_table_1.rb
    puts "1 * 9 = #{1 * 9}"
    puts "2 * 9 = #{2 * 9}"
    puts "3 * 9 = #{3 * 9}"
    puts "4 * 9 = #{4 * 9}"
    puts "5 * 9 = #{5 * 9}"
    puts "6 * 9 = #{6 * 9}"
    puts "7 * 9 = #{7 * 9}"
    puts "8 * 9 = #{8 * 9}"
    puts "9 * 9 = #{9 * 9}"
    puts "10 * 9 = #{10 * 9}"

This is a problem in at least two ways.  Firstly, all that typing's tedious!  Secondly, it gives us no way to repeat something a varying number of times, depending on some condition.

Fortunately, Ruby makes it very easy to solve these problems, with a `while` statement.

The general form of a `while` statement is very similar to that of a simple `if` statement:

    while <condition>
      <do something>
    end

The code after the condition and before `end` is run repeatedly, until the condition evaluates to `false`.

We can rewrite our times table code to use a `while` statement and cut down on typing:

    # examples/nine_times_table_2.rb
    i = 1

    while i <= 10
      puts "#{i} * 9 = #{i * 9}"
      i += 1
    end

> Question: What happens if you remove the line `i += 1`?
>
> Task: Update `nine_times_table_2.rb` so that it asks the user how many multiples of nine it should display.  How would you have implemented that if you did not have access to a `while` loop?

We now know enough Ruby to write a simple guessing game.

    # examples/higher_or_lower.rb
    n = rand(1..100)

    puts "I'm thinking of a number between 1 and 100."

    puts "Make a guess!"
    guess = gets.chomp.to_i

    while guess != n
      if guess < n
        puts "Too low."
      else
        puts "Too high."
      end

      puts "Make a guess!"
      guess = gets.chomp.to_i
    end

    puts "Yes, my number was #{n}."

When you run this program, you might see something like this:

    $ ruby higher_or_lower.rb 
    I'm thinking of a number between 1 and 100.
    Make a guess!
    50
    Too low.
    Make a guess!
    75
    Too high.
    Make a guess!
    67
    Too high.
    Make a guess!
    58
    Yes, my number was 58.

> Exercise: A user might make a guess that couldn't possibly be right.  For instance, they might be told that 50 is too high, which means that a guess for 51 will definitely be wrong.  Modify `higher_or_lower.rb` so that the program keeps track of the range of guesses that are valid, and tell the user they're being daft if they make an impossible guess.

It's sometimes useful to break out of a `while` loop early.  We can do that with the `break` keyword.  It's a common pattern to make the `while` loop's condition be simply `true`, and then to use `break` to exit the loop.  For instance:

    # examples/nine_times_table_3.rb

    i = 1

    while true
      puts "#{i} * 9 = #{i * 9}"
      i += 1
      if i > 10
        break
      end
    end

> Task: Rewrite `higher_or_lower.rb` to use `while true` and `break`.  How does this allow you to tidy up the code?
>
> Exercise: In the directory `exercises/syntax-errors`, there are several files called `while_xx.rb`.  Each of these contains a syntax error.  Find the errors, and fix them.

### Building blocks: Functions

Let's say we want to ask a user when they were born.  There are many ways to do this, but for the sake of example, we'll ask them the year they were born, the month they were born, and then the day they were born:

    # examples/get_birthday.rb

    while true
      puts "What year were you born in?"

      year = gets.chomp.to_i

      if year < 1900 || year > 2015
        puts "Invalid response"
      else
        break
      end
    end

    while true
      puts "What month were you born in?"

      month = gets.chomp.to_i

      if month < 1 || month > 12
        puts "Invalid response"
      else
        break
      end
    end

    while true
      puts "What day were you born on?"

      day = gets.chomp.to_i

      if day < 1 || day > 31
        puts "Invalid response"
      else
        break
      end
    end

    puts "You were born on #{year}-#{month}-#{day}"

> Task: Run this program and check you understand what each line does.

Notice how repetitive the code is.  We've got almost three identical fragments of the following structure:

    while true
      puts question

      value = gets.chomp.to_i

      if value < lower_bound || value > upper_bound
        puts "Invalid response"
      else
        break
      end
    end

The only difference between each fragment is the question that's asked, and the upper and lower bounds that the response is checked against.

Whenever we have repeated patterns in our code, we can extract the pattern into something we call a "function".  A function is a fragment of code that is defined in one part of code, but once defined, can be invoked, or called, from anywhere.  Like most things, functions are best described by example.

Here's a really simple function definition.  When the function is called, it simply displays the current time.

    def display_current_time
      puts Time.now
    end

Now, whenever we want to display the current time, we can call this function:

    display_current_time
    sleep 5
    display_current_time

> Task: Create a new Ruby file, and copy both the function definition and the code that calls the function.  Run the file and check that it works as you expect.

We'll usually want to pass arguments to a function.  Here's a function that, when called, asks the user a question and then displays their response:

    def ask_question(question)
      puts question
      response = gets.chomp
      puts "You said: #{response}"
    end

Now, whenever we want to ask the user a question, we can call this function with a single argument:

    ask_question("What's your name?")
    ask_question("What did you have for breakfast?")

> Task: In IRB, define `ask_question` using the definition above, and then call it, passing in different arguments.

A function will usually return a value, which the calling code can use.  A function will return the value of the last expression in its body.  Here's a function that takes as arguments the lengths of the two shorter sides of a right-angled triangle, and returns the length of the hypotenuse:

    def hypotenuse(x, y)
      x_squared = x * x
      y_squared = y * y
      (x_squared + y_squared) ** 0.5
    end

    h = hypotenuse(3, 4)
    puts "The length of the hypotenuse of a right-angled triangle whose shorter sides are of length 3 and 4 is #{h}"

We've actually already come across functions, except we've called them "methods".  Methods are simply functions that belong to a particular value.

Going back to our birthday program, we can write a function called `get_response`, which we can call with three arguments: a question, an upper bound, and a lower bound.  When we call this function, it ensures that the user enters a valid value, and then returns that value.

    # examples/get_birthday_2.rb
    def get_response(question, lower_bound, upper_bound)
      while true
        puts question
    
        value = gets.chomp.to_i
    
        if value < lower_bound || value > upper_bound
          puts "Invalid response"
        else
          break
        end
      end
    
      value
    end
    
    year = get_response("What year were you born in?", 1900, 2015)
    month = get_response("What month were you born in?", 1, 12)
    day = get_response("What day were you born on?", 1, 31)
    
    puts "You were born on #{year}-#{month}-#{day}"

> Task: Run this program, and verify that it has the same behaviour as `get_birthday.rb`.
>
> Question: What's the problem with this program?  How could you fix it?
>
> Exercise: In the directory `exercises/syntax-errors`, there are several files called `functions_xx.rb`.  Each of these contains a syntax error.  Find the errors, and fix them.
>
> Exercise: In `exercises/exercises_1.rb` there are several skeletons of functions, along with code to test that the functions are correct.  When you run the program with `ruby exercises_1.rb`, the test code will run, and will tell you whether the functions are correct.  At first, none of them will be.  Flesh out the bodies of the functions so that the tests pass.


### Data types: Numbers

When we used IRB as a calculator, we encountered most of the common things you can do with numbers.  You can add, subtract, and multiply them as you'd expect:

    > 10 + 25
     => 35
    > 10 - 25
     => -15
    > 10 * 25
     => 250

Division is a bit surprising:

    > 10 / 25
     => 0
    > 25 / 10
     => 2

This is because Ruby actually has two different basic types of number, `Fixnum` and `Float`.  "Fixnum" is Ruby's word for an integer, while "float" is Ruby's word for a non integer number.  `Fixnum` and `Float` are actually class names.  (Remember, every value has a class, which describes the kind of thing it is, and the kinds of things you can do with it.)

    > 10.class
     => Fixnum
    > 10.5.class
     => Float
    > 10.0.class
     => Float

Notice that `10` and `10.0` are different values, because they belong to different classes.  However, when compared, they are considered to be the same:

    > 10 == 10.0
     => true

When we divide two `Fixnum`s, we get another `Fixnum`.  If we want, instead, to get a `Float`, we have to ensure that at least one of the arguments is also a `Float`:

    > 10.0 / 25
     => 0.4
    > 10 / 25.0
     => 0.4
    > 10.0 / 25.0
     => 0.4

If we have a name that might refer to a `Fixnum` or a `Float`, we can call `to_f` on the value of the name just to be sure:

    > n = 10
     => 10
    > m = 25
     => 25
    > n.to_f / m
     => 0.4

Note that calling `to_f` on the value of a name returns a new value, and doesn't change the value that the name refers to:

    > n = 10
     => 10
    > n.to_f
     => 10.0
    > n
     => 10

There are some additional methods that are available on instances of `Fixnum`:

    > 10.even?
     => true
    > 10.odd?
     => false
    > 10.between?(5, 15)
     => true
    > 10.between?(15, 25)
     => false
    > 10.between?(10, 15)
     => true
    > 10.abs
     => 10
    > -10.abs
     => 10

Instances of `Float` also have some useful methods:

    > 10.4.round
     => 10
    > 10.5.round
     => 11
    > 10.5.floor
     => 10
    > 10.5.ceil
     => 11
    > 10.5.integer?
     => false
    > 10.5.ceil.integer?
     => true
    > 10.5.zero?
     => false

There are a couple of other numerical data types that can be constructed from instances of `Fixnum` or instances of `Float`.  Firstly, we can call `rationalize` on a number to get that number as a fraction:

    > 0.25.rationalize
     => (1/4)
    > 25.rationalize
     => (25/1)
    > 1.rationalize / 3.rationalize
     => (1/3)
    > 1.rationalize / 2.rationalize + 1.rationalize / 3.rationalize + 1.rationalize / 3.rationalize
     => (7/6)

This is occasionally useful when we need to do precise fractional arithmetic

Secondly, we can call `i` on a number to get the corresponding imaginary number.  We can then add this to a real number to get a complex number, which we can use to do complex arithmatic:

    > 1 + 1.i
     => (1+1i)
    > (1 + 1.i).class
     => Complex
    > (1 + 1.i) * (1 - 1.i)
     => (2+0i)

Don't worry if you've not encountered complex numbers before!  I'm just including this to demonstrate what's possible with Ruby.  In fact I've never used them in Ruby, and I'm not sure I ever will!


### Getting help: Ruby documentation

Most built in data types are documented fairly well online, at the official Ruby documentation at http://www.ruby-doc.org/.

The documentation for 1.9.3 is not linked to directly from the home page of ruby-doc.org, but if you click on "more..." in the section under "Core API", you'll see a link to "1.9.3 core".  This will take you to http://www.ruby-doc.org/core-1.9.3/.

You can now search for classes and methods.

> Task: Find the documentation for "Fixnum" and work out what the `abs` method does.

The official Ruby documentation is only fairly good.  There's an active project to improve it: see http://documenting-ruby.org/. If you want to get involved in open source software, helping out with documentation is an excellent place to start!


### Data types: Strings

Another common data type is `String`.  A string represents text.  We've seen how we can get strings from a user with `gets`, and we'll see how we can get strings by reading a file, reading from a database, or by making a network request.  We'll be dealing with strings a lot!

We can also hardcode strings in our code.  A hardcoded value is called a "literal", and a string literal is some text enclosed in double quotes:

    > "This is some text"
     => "This is some text"
    > "This is some text".class
     => String

One very useful feature of Ruby is the ability to interpolate values inside a string.  We've already seen this:

    > name = "John"
     => "John"
    > "Hello, #{name}"
     => "Hello, John"
    > x = 10
     => 10
    > y = 15
     => 15
    > "#{x} + #{y} = #{x} + #{y}"
     => "10 + 15 = 10 + 15"

There are lots of methods available on strings, most of which are self-explanatory:

    > "Peter".reverse
     => "reteP"
    > "Peter".upcase
     => "PETER"
    > "Peter".downcase
     => "peter"
    > "Peter".swapcase
     => "pETER"
    > "peter".capitalize
     => "Peter"
    > "Peter".count("e")
     => 2
    > "Peter".count("r")
     => 1
    > "Peter".count("p")
     => 0
    > "Peter".index("P")
     => 0
    > "Peter".index("e")
     => 1
    > "Peter".index("t")
     => 2
    > "Peter".index("z")
     => nil
    > "Peter".include?("P")
     => true
    > "Peter".include?("p")
     => false
    > "Peter".include?("ter")
     => true
    > "Peter".start_with?("P")
     => true
    > "Peter".start_with?("Pet")
     => true
    > "Peter".sub("e", "E")
     => "PEter"
    > "Peter".gsub("e", "E")
     => "PEtEr"
    > "Peter".ljust(10)
     => "Peter     "
    > "Peter".rjust(10)
     => "     Peter"
    > "Peter".ljust(10, ".")
     => "Peter....."
    > "Peter"[0]
     => "P"
    > "Peter"[-1]
     => "r"
    > "Peter"[1]
     => "e"
    > "Peter"[10]
     => nil
    > "Peter"[0..3]
     => "Pete"
    > "Peter"[0..-2]
     => "Pete"
    > "Peter"[0..-3]
     => "Pet"
    > "Peter"[1..-3]
     => "et"
    > "Peter"[1..-2]
     => "ete"
    > "I like programming in Ruby".split
     => ["I", "like", "programming", "in", "Ruby"]
    > "I like programming in Ruby".split("i")
     => ["I l", "ke programm", "ng ", "n Ruby"]
    > "I like programming in Ruby".split("")
      => ["I", " ", "l", "i", "k", "e", " ", "p", "r", "o", "g", "r", "a", "m", "m", "i", "n", "g", " ", "i", "n", " ", "R", "u", "b", "y"]

There are also several methods which, if called on a name, change the value which the name refers to.  Typically, these methods end with an exclamation mark.  For instance:

    > n = "Peter"
     => "Peter"
    > n.upcase
     => "PETER"
    > n
     => "Peter"
    > n.upcase!
     => "PETER"
    > n
     => "PETER"

> Task: For each of the string methods demonstrated above, work out which of them have an alternative form that modifies the string.


### Data types: Arrays

Rather than dealing with items (such as numbers and strings) individually, we often want to deal with a collection of items.  The simplest type of collection in Ruby is the `Array`.  An array is an ordered list of items.

An array literal contains the elements, separated by commas, surrounded by square brackets:

    > a = [1, 2, 3, 4, 5]
     => [1, 2, 3, 4, 5]

We can find out how long an array is:

    > a.size
     => 5

We can add new elements to either end of array:

    > a.push(10)
     => [1, 2, 3, 4, 5, 10]
    > a.unshift(0)
     => [0, 1, 2, 3, 4, 5, 10]
    > a.size
     => 7

We can remove elements from either end of an array:

    > a.pop
     => 10
    > a.shift
     => 0
    > a
     => [1, 2, 3, 4, 5]

We can look up the element at a given position:

    > a[0]
     => 1
    > a[4]
     => 5
    > a[-1]
     => 5
    > a[-2]
     => 4
    > a[5]
     => nil

Notice that the first element of an array has index 0, and that we can look up elements based on their position from the end of the array.  We saw something similar with strings.

Given an array of `String`s, we can join them together:

    > ["I", "like", "programming", "in", "Ruby"].join(" ")
     => "I like programming in Ruby"
    > ["I", "like", "programming", "in", "Ruby"].join(".")
     => "I.like.programming.in.Ruby"
    > ["I", "like", "programming", "in", "Ruby"].join("")
     => "IlikeprogramminginRuby"

We can sort arrays:

    > [2, 1, 5, 3, 4].sort
     => [1, 2, 3, 4, 5]

We can select, or reject, just the elements of an array that match a condition:

    > a.select {|n| n.odd?}
     => [1, 3, 5]
    > a.reject {|n| n.odd?}
     => [2, 4]
    > a.select {|n| n < 3}
     => [1, 2]
    > a.select {|n| n % 3 == 2}
     => [2, 5]

The `{...}` construction is called a block.  A block is a bit like an anonymous function that gets passed as an argument to another function (or method) which will then call it one or more times.

So, you can think of the block `{|n| n.odd?}` as being like this function:

    def f(n)
      n.odd?
    end

except that the function has no name.  It then gets passed as an argument to `a.select`, which will call the function once for each element in `a`.  It will return a new array containing just the elements of `a` for which the function returns true.

There are several other array methods that accept blocks.  We can find out whether all, or any, elements of an array satisfy some condition:

    > a.all? {|n| n < 3}
     => false
    > a.any? {|n| n < 3}
     => true
    > a.all? {|n| n < 30}
     => true
    > a.any? {|n| n > 30}
     => false

We can count how many elements satisfy some condition:

    > a.count {|n| n > 3}
     => 2
    > a.count {|n| n > 30}
     => 0

We can use a block to change how an array is sorted:

    > a.sort_by {|n| -n}
     => [5, 4, 3, 2, 1]
    > ["One", "Two", "Three", "Four"].sort_by {|s| s.size}
     => ["One", "Two", "Four", "Three"]

We can create a new array where each element of the new array is some transformation of the original array:

    > a.map {|n| n * n}
     => [1, 4, 9, 16, 25]
    > a.map {|n| n.even?}
     => [false, true, false, true, false]
    > a.map {|n| "x" * n}
     => ["x", "xx", "xxx", "xxxx", "xxxxx"]

Finally, we can do something once for each element of an array:

    > a.each {|n| puts "#{n} * #{n} = #{n * n}"}
    1 * 1 = 1
    2 * 2 = 4
    3 * 3 = 9
    4 * 4 = 16
    5 * 5 = 25
     => [1, 2, 3, 4, 5]

There is an alternate, more-or-less equivalent, syntax for blocks:

    > a.each do |n|
    >   puts "#{n} * #{n} = #{n * n}"
    > end
    1 * 1 = 1
    2 * 2 = 4
    3 * 3 = 9
    4 * 4 = 16
    5 * 5 = 25
     => [1, 2, 3, 4, 5]


> Exercise: In the directory `exercises/syntax-errors`, there are several files called `arrays_xx.rb`.  Each of these contains a syntax error.  Find the errors, and fix them.
>
> Exercise: In `exercises/exercises_2.rb` there are several more skeletons of functions.  As with the earlier exercise with `exercises_1.rb`, flesh these out.  Most of these will require you to use the methods on numbers, strings, and arrays that we've just learnt about.


### Worked example: Hangman

We now know enough to write a more complex guessing game: hangman.  The computer will choose a word, and the player has to guess the letters of that word.  The player can make a limited number of incorrect guesses.  If they guess the whole word without running out of lives, they win, otherwise they lose.

We'll work through this together, and see how we can use functions to help structure our code.

To begin with, let's sketch out the algorithm of the game in pseudocode.

    choose word

    while the player has some lives left
      display the word with unguessed letters concealed
      get guess from player

      if guess is correct
        tell player their guess is correct
        if player has guessed the word
          break out of the loop
        end
      otherwise
        subtract a life
        tell player their guess is incorrect, and how many lives they have left
      end
    end

    if player has some lives left
      tell the player they have won, and how many lives they have left
    otherwise
      tell the player they have lost, and what the word was
    end

We can replace each condition and each instruction with a function call.

    word = choose_word
    guesses = []
    lives = 5

    while player_has_lives_left(lives)
      display_concealed_word(word, guesses)
      guess = get_guess
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

> Question: What would happen if you tried to run this code as it stands?

We can now define each required function.  For now, we'll rig `choose_word` so that it always returns the same thing.

    def choose_word
      "HIPPOPOTAMUS"
    end

It's easy to tell whether the player has any lives left:

    def player_has_lives_left(lives)
      return lives > 0
    end

Displaying the word with any unguessed letters concealed involves turning the word into an array, by splitting on the empty string.  We can then iterate over the letters in that array, and build up a new array with the characters to display:

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

Getting the player's guess should look quite familiar:

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

Everything else is very straightforward:

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

    def tell_player_guess_is_correct
      puts "Correct!"
    end

    def tell_player_guess_is_incorrect(lives)
      puts "Incorrect!  You have #{lives} lives left."
    end

    def tell_player_they_have_won(lives)
      puts "Well done!  You won with #{lives} lives left."
    end

    def tell_player_they_have_lost(word)
      puts "Bad luck!  The word was #{word}."
    end

> Task: Copy this code into a new file, `hangman.rb`, and run it.  Play a few games.  Check the behaviour is as you'd expect, and make sure you understand how it all works.
>
> Task: The program might end with displaying `You won with 1 lives left.`  Fix this.
>
> Task: Make the number of lives configurable.
>
> Task: The player can make the same incorrect guess multiple times.  Change the code to prevent this happening.
>
> Task: Rewrite `hangman.rb` so as not to use any functions.  How does the implementations compare?  Which do you prefer?
>
> Exercise: Write a two player noughts and crosses game.  Begin by sketching out the algorithm using pseudocode, as we have done here.  Slowly convert your pseudocode to Ruby, until you have a working game.
>
> Bonus exercise: Extend your noughts and crosses game so that a player can play against an AI.  Again, sketch out the AI's algorithm in pseudocode before beginning.


### Data types: Hashes

Another common type of collection in Ruby is `Hash`.  A hash is a collection of keys, each of which has a corresponding value.  Usually, the keys are strings, while the values can be of any type.

Here's a hash literal:

    > h = {"name" => "Sarah", "age" => 30, "occupation" => "GP"}
     => {"name"=>"Sarah", "age"=>30, "occupation"=>"GP"}

Given a hash, we can find out what keys it has:

    > h.keys
     => ["name", "age", "occupation"] 

Given a key, we can look up the corresponding value in a hash:

    > h["name"]
     => "Sarah"
    > h["age"]
     => 30

We can add keys to a hash:

    > h["hometown"] = "Exeter"
     => "Exeter"
    > h
     => {"name"=>"Sarah", "age"=>30, "occupation"=>"GP", "hometown"=>"Exeter"}

We can update the value corresponding to a key:

    > h["age"] = 31
     => 31
    > h
     => {"name"=>"Sarah", "age"=>31, "occupation"=>"GP", "hometown"=>"Exeter"}

We can also remove a key from a hash:

    > h.delete("name")
     => "Sarah"
    > h
     => {"age"=>31, "occupation"=>"GP", "hometown"=>"Exeter"}

If a key is not in a hash, when we try to look it up, we will get `nil`:

    > h["name"]
     => nil

Like an array, we can do something for each key/value pair in a hash:

    > h.each {|k, v| puts "#{k}: #{v}"}
    age: 31
    occupation: GP
    hometown: Exeter
     => {"age"=>31, "occupation"=>"GP", "hometown"=>"Exeter"}

We can also filter a hash, and use many of the same methods that we can use with arrays:

    > winners = {"Manchester United" => 13, "Blackburn Rovers" => 1, "Arsenal" => 3, "Chelsea" => 3, "Manchester City" => 2}
     => {"Manchester United"=>13, "Blackburn Rovers"=>1, "Arsenal"=>3, "Chelsea"=>3, "Manchester City"=>2} 
    > winners.select {|team, n| n > 1}
     => {"Manchester United"=>13, "Arsenal"=>3, "Chelsea"=>3, "Manchester City"=>2} 
    > winners.select {|team, n| team.include?("Manchester")}
     => {"Manchester United"=>13, "Manchester City"=>2} 
    > winners.count {|team, n| team.include?("Manchester")}
     => 2 
    > winners.all? {|team, n| n > 1}
     => false 
    > winners.any? {|team, n| n > 10}
     => true 

When we iterate over a hash, the order of keys depends on the order in which they were inserted into the hash.

> Task: Write a function that takes a string, splits the string into characters, and returns a hash where the keys are the characters in the string, and the values are the number of times the character appears in the string.
>
> Task: Write a function that takes a hash whose values are numbers, and returns the key with the highest value.
>
> Task: Write a function that takes a string, and returns the most common character in the string.
>
> Exercise: In `exercises/exercises_3.rb` there are several more skeletons of functions.  As with the earlier exercises, flesh these out.



### The filesystem: reading from a file

We can store all sorts of textual (and non-textual) data in files.  Ruby makes it easy to open files on the filesystem and to read their contents.

> Task: Create a simple text file in a temporary directory, such as `C:\tmp` or `/tmp`, call it something like `test.txt`, and puts a few lines of text in it.  I'll assume this file exists and is readable.

Unless a file is very large, the easiest way to deal with a file is to read its contents into memory in one go:

    > contents = File.read('/tmp/test.txt')
     => "The Owl and the Pussy-cat went to sea\n   In a beautiful pea-green boat,\nThey took some honey, and plenty of money,\n   Wrapped up in a five-pound note.\n"

Notice that we get a string back.  If your file contains several lines, you will see newline characters (`\n`) and on Windows you may also see carriage return characters (`\r`).

We can do anything we like with this string.  One common thing to do is to iterate over it line by line:

    > contents.each_line {|line| puts "#{line.size} :: #{line}"}
    38 :: The Owl and the Pussy-cat went to sea
    34 ::    In a beautiful pea-green boat,
    43 :: They took some honey, and plenty of money,
    36 ::    Wrapped up in a five-pound note.
     => "The Owl and the Pussy-cat went to sea\n   In a beautiful pea-green boat,\nThey took some honey, and plenty of money,\n   Wrapped up in a five-pound note.\n"

We can call `File.read` with either an absolute or a relative path.  It's almost always best to call it with an absolute path, because it's not always clear what the path would be relative to.

> Task: Write a function that takes a path to a file, and returns the longest line in the file.
>
> Question: What happens if you try to read from a file that does not exist?


### The filesystem: writing to a file

Writing to a file is a little bit more involved.  We must first open a file for writing, then write text to the file, and then close the file:

    > f = File.open("/tmp/test2.txt", "w")
     => #<File:/tmp/test2.txt>
    > f.write("Hello world\n")
     => 12
    > f.write("Isn't this fun?\n")
     => 16
    > f.close
     => nil

> Question: What happens if you omit the `"w"` argument to `File.open`, and then try to write to the resulting file?
>
> Question: What happens if you change the `"w"` argument to `File.open` to `"a"`?
>
> Question: What is the return value of the `write` method?
>
> Task: In the hangman game, choose a word at random from the file `english-word-list`.
>
> Task: In your noughts and crosses game, implement saving and loading the state of the game.


### Running Ruby: Installing gems with bundler

One of the strengths of Ruby is that there are many third party libraries available for all sorts of tasks.  Third party libraries are called "gems", and can be installed with a tool called "bundler".

Each project you work on might depend on different gems, so projects typically come with a file called `Gemfile`.  This file specifies the gems that the project depends on, as well as acceptable versions of those gems.  A project might also come with a file called `Gemfile.lock`, which contains the exact versions of the gems that the project author has tested the project with.  The reason for having two files is important but subtle, so we won't go into too much depth here.

Given a project with a `Gemfile` (and possibly a `Gemfile.lock`) you can make sure that you have the right versions of all the project's required gems by running:

    $ bundle install

from the same directory as the Gemfile.  If it's successful, you should see something ending with:

    Your bundle is complete!
    Use `bundle show [gemname]` to see where a bundled gem is installed.

For this training course, we'll only use a handful of third party gems.


### Running Ruby: Testing with Minitest

One of the benefits of breaking up complicated code into smaller functions is that each function can be tested separately.  We've seen this in `exercises_1.rb` and `exercises_2.rb`, but it's unusual to have code and tests in the same file.  A more usual project layout has product code in a directory called `lib`, and test code in a directory called `test`.  You would typically also have a file called `Rakefile` that contains configuration for running tasks related to the project.

In `examples/functions`, we have the following files:

 * `/Gemfile`
 * `/Rakefile`
 * `/lib/functions_1.rb`
 * `/lib/functions_2.rb`
 * `/test/functions_1_test.rb`
 * `/test/functions_2_test.rb`

The two files in `lib` contain the functions that we defined yesterday (with solutions!) while the two files in `test` contain the tests.  The one change we've had to make is that the functions are now defined inside a module:

    # lib/functions_1.rb
    
    module Functions1
      extend self
    
      def abs(x)
      ...
    end

This means that when we load `functions_1.rb` from a test file, with `require "functions_1"`, we have access to the module `Functions1`, and so we can test the functions that are defined inside the module.  Don't worry too much about what a module is at this stage.

There's a little bit of configuration in this project's `Rakefile` that allow us to use the `rake` command to run all the tests for a project:

    # Rakefile
    
    require 'rake/testtask'
    
    Rake::TestTask.new do |t|
      t.pattern = "test/*_test.rb"
    end

This means we can run `rake test` from the command line to run all the tests for the project.

    $ rake test
    Run options: --seed 23376
    
    # Running:
    
    ....................
    
    Finished in 0.002816s, 7102.2727 runs/s, 20241.4773 assertions/s.
    
    20 runs, 57 assertions, 0 failures, 0 errors, 0 skips

You can read more about Rake at http://jasonseifer.com/2010/04/06/rake-tutorial.

All the tests in the test directory make use of `assert_equal`, which is a function from the minitest library.  There are many different kinds of assertions provided by minitest, which are documentated at http://docs.seattlerb.org/minitest/Minitest/Assertions.html.

### Running Ruby: Testing with RSpec

One of the benefits of breaking up complicated code into smaller functions is that each function can be tested separately.  We've seen this in `exercises_1.rb` and `exercises_2.rb`, but it's unusual to have code and tests in the same file.  A more usual project layout has product code in a directory called `lib`, and test code in a directory called `spec`.  You would typically also have a file called `Rakefile` that contains configuration for running tasks related to the project.

In `examples/testing_rspec`, we have the following files:

 * `/Gemfile`
 * `/Rakefile`
 * `/lib/functions_1.rb`
 * `/lib/functions_2.rb`
 * `/spec/functions_1_spec.rb`
 * `/spec/functions_2_spec.rb`

The two files in `lib` contain the functions that we defined yesterday (with solutions!) while the two files in `spec` contain the tests.  The one change we've had to make is that the functions are now defined inside a module:

    # lib/functions_1.rb
    
    module Functions1
      extend self
    
      def abs(x)
      ...
    end

This means that when we load `functions_1.rb` from a spec file, with `require "functions_1"`, we have access to the module `Functions1`, and so we can test the functions that are defined inside the module.  Don't worry too much about what a module is at this stage.

There's a little bit of configuration in this project's `Rakefile` that allow us to use the `rake` command to run all the specs for a project:

    # Rakefile
    
    require 'rake/testtask'
    
    Rake::SpecTask.new do |t|
      t.pattern = "spec/*_spec.rb"
    end

This means we can run `rake spec` from the command line to run all the specs for the project.

    $ rake spec
    Run options: --seed 23376
    
    # Running:
    
    ....................
    
    Finished in 0.002816s, 7102.2727 runs/s, 20241.4773 assertions/s.
    
    20 runs, 57 assertions, 0 failures, 0 errors, 0 skips

You can read more about Rake at http://jasonseifer.com/2010/04/06/rake-tutorial.

All the tests in the specs directory make use of RSpec's expectation syntax.  There are many different kinds of expectations provided by RSpec, which are documentated at https://www.relishapp.com/rspec

### Running Ruby: Testing with cucumber

In `examples/calculator`, we have the following files:

 * `Gemfile`
 * `calculator.rb`
 * `features/adding.feature`
 * `features/step_definitions/calculator_steps.rb`

> Task: As this project includes a `Gemfile`, run `bundle` from the command line in the project directory to ensure you have all the necessary requirements.

`calculator.rb` defines a simple command line program that reads a calculation from the command line and calculates the answer.

    $ ruby calculator.rb "(1 + 2) * (3 + 4)"
    21
    $ ruby calculator.rb "1 + 2 * 3 + 4"
    11
    $ ruby calculator.rb "1 * 2 + 3 * 4"
    14
    $ ruby calculator.rb "1 * (2 + 3) * 4"
    20

You could look at the implementation of `calculator.rb`, but it's not very exciting.  We're more interested here in how we'd test it as a "black box", that is, without knowing anything about its implementation.  This is where Cucumber comes in.

Cucumber is a tool for writing acceptance tests of the form:

    Given I am an admin of the site
    When I log in to the site
    Then I should see a list of all users who have signed up this week

It is useful for expressing the requirements of a system in a form that non-technical stakeholders can understand, with the added benefit that, with a little bit of work on our part, Ruby is able to test that the system under test fulfills the requirements.

With Cucumber, specifications are grouped into features, each of which defines a number of scenarios.  We have a feature file, `adding.feature`, which contains the specifications for how the calculator should handle addition.

We can test the features by running `cucumber` from the command line in the `calculator` directory.  You should see something like this:

    $ cucumber 
    Feature: Adding
    
      Scenario: Add two numbers       # features/adding.feature:2
        Given the input "2+2"         # features/adding.feature:3
        When the calculator is run    # features/adding.feature:4
        Then the output should be "4" # features/adding.feature:5
    
    1 scenario (1 undefined)
    3 steps (3 undefined)
    0m0.002s
    
    You can implement step definitions for undefined steps with these snippets:
    
    Given(/^the input "(.*?)"$/) do |arg1|
      pending # express the regexp above with the code you wish you had
    end
    
    When(/^the calculator is run$/) do
      pending # express the regexp above with the code you wish you had
    end
    
    Then(/^the output should be "(.*?)"$/) do |arg1|
      pending # express the regexp above with the code you wish you had
    end

> Task: Run `cucumber` from the command line in the `calculator` directory, and make sure you get output similar to the above.  Try to understand what it means.

Cucumber is telling us that it's tried to run one scenario, which has three steps, but that all three steps are undefined, and so the scenario is undefined.  So we need to define them!  Cucumber gives us some snippets that we can use as a starting point for the definitions of these steps.

> Task: Create a directory inside `features` called `step_definitions`, and inside there, create a file called `calculator_steps.rb`.  Paste the three snippets into this file, and run `cucumber` again.

You should see something like this:

    $ cucumber 
    Feature: Adding
    
      Scenario: Add two numbers       # features/adding.feature:2
        Given the input "2+2"         # features/step_definitions/calculator_steps.rb:1
          TODO (Cucumber::Pending)
          ./features/step_definitions/calculator_steps.rb:2:in `/^the input "(.*?)"$/'
          features/adding.feature:3:in `Given the input "2+2"'
        When the calculator is run    # features/step_definitions/calculator_steps.rb:5
        Then the output should be "4" # features/step_definitions/calculator_steps.rb:9
    
    1 scenario (1 pending)
    3 steps (2 skipped, 1 pending)

Notice that the scenario is now pending, and not undefined.  This is because we now have definitions for each of the three steps in the scenario, but for each step definition, the corresponding block just contains `pending`.  So we need to replace that `pending` with something useful.

All we need to do for the `Given` step is to keep a record of the input that the step describes.

> Task: Edit `calculator_steps.rb` so that the first step matches:

    Given('the input "$input"') do |input|
      @input = input
    end

You define an implementation of a `Given` step by calling the function `Given` with a string argument and a block.  In this case, the string is `'the input "$input"'`.  When Cucumber runs a feature and encounters a `Given` step, it will try to match the text in the feature against the strings that you have called the `Given` function with.  

In our case, it can match `'the input "2+2"'` (from the feature) against `'the input "$input"'` (which we called the `Given` function with) and so it will run the code in the block, with the block argument(s) set to the value that is captured from the text in the feature.

This is all a bit magic, but I promise you'll get used to it quickly.

For our implementation, we assign the value that is captured from the feature to `@input`, which is an "instance variable".  Don't worry too much about what an instance variable is.  What's important is that we'll be able to use the value that it refers to in the other step definitions.

Now when you run `cucumber`, you should see something like this:

    $ cucumber
    Feature: Adding
    
      Scenario: Add two numbers       # features/adding.feature:2
        Given the input "2 + 2"       # features/step_definitions/calculator_steps.rb:1
        When the calculator is run    # features/step_definitions/calculator_steps.rb:5
          TODO (Cucumber::Pending)
          ./features/step_definitions/calculator_steps.rb:7:in `/^the\ calculator\ is\ run$/'
          features/adding.feature:4:in `When the calculator is run'
        Then the output should be "4" # features/step_definitions/calculator_steps.rb:10
    
    1 scenario (1 pending)
    3 steps (1 skipped, 1 pending, 1 passed)
    0m0.026s

> Task: Edit `calculator_steps.rb` so that the second step matches:

    When('the calculator is run') do
      @output = `ruby calculator.rb #{@input}`
    end

Defining `When` steps takes the same form as defining `Given` steps.  The only difference in this case is that the string that we call `When` with doesn't capture any values from the corresponding text in the feature, and so the block doesn't take any arguments.  The block itself spawns a subprocess and runs `ruby calculator.rb` with the value of `@input` as a command line argument.

Now when you run `cucumber`, you should see something like this:

    $ cucumber
    Feature: Adding
    
      Scenario: Add two numbers       # features/adding.feature:2
        Given the input "2 + 2"       # features/step_definitions/calculator_steps.rb:1
        When the calculator is run    # features/step_definitions/calculator_steps.rb:5
        Then the output should be "4" # features/step_definitions/calculator_steps.rb:9
          TODO (Cucumber::Pending)
          ./features/step_definitions/calculator_steps.rb:11:in `/^the\ output\ should\ be\ "(.*)"$/'
          features/adding.feature:5:in `Then the output should be "4"'
    
    1 scenario (1 pending)
    3 steps (1 pending, 2 passed)
    0m0.965s

> Task: Edit `calculator_steps.rb` so that the third step matches:

    Then('the output should be "$output"') do |output|
      assert_equal(@output.strip, output)
    end

The `Then` step is what checks that the system under test is actually behaving correctly.  We're using `minitest`'s `assert_equal` to check that the output of running `calculator.rb` matches what the feature says.

Now when you run `cucumber`, you should see something like this:

    $ cucumber
    Feature: Adding
    
      Scenario: Add two numbers       # features/adding.feature:2
        Given the input "2 + 2"       # features/step_definitions/calculator_steps.rb:1
        When the calculator is run    # features/step_definitions/calculator_steps.rb:5
        Then the output should be "4" # features/step_definitions/calculator_steps.rb:9
    
    1 scenario (1 passed)
    3 steps (3 passed)
    0m0.971s

We can be sure that our calculator can add two and two to get four!

> Task: Change `assert_equal` to `refute_equal` and re-run `cucumber`.  Does what you see make sense?
>
> Task: Add lots of `puts` statements to the code in `calculator_steps.rb` to help you understand how the code is being used.



### Working with a database

We can use Ruby to interact with a database.  For these examples we'll use SQLite, but the principles are similar when using other database systems, such as Postgres or Oracle.

Here is an IRB session demonstrating use of the `sqlite3` gem.

    > require 'sqlite3'
     => true 
    > db = SQLite3::Database.open("demo.db")
     => #<SQLite3::Database:0x007feda2e24900>
    > db.execute("CREATE TABLE IF NOT EXISTS employees(name, department)")
     => [] 
    > db.execute("INSERT INTO employees(name, department) VALUES (?, ?)", ["Tim", "Engineering"])
     => [] 
    > db.execute("INSERT INTO employees(name, department) VALUES (?, ?)", ["Sarah", "Engineering"])
     => [] 
    > db.execute("INSERT INTO employees(name, department) VALUES (?, ?)", ["Sue", "Sales"])
     => [] 
    > db.execute("INSERT INTO employees(name, department) VALUES (?, ?)", ["John", "Sales"])
     => [] 
    > db.execute("INSERT INTO employees(name, department) VALUES (?, ?)", ["Sam", "HR"])
     => [] 
    > db.execute("SELECT * FROM employees WHERE department = ?", ["Sales"])
     => [["Sue", "Sales"], ["John", "Sales"]] 
    > db.execute("SELECT * FROM employees WHERE department = ?", ["Engineering"])
     => [["Tim", "Engineering"], ["Sarah", "Engineering"]] 
    > db.execute("SELECT * FROM employees WHERE name LIKE ?", ["S%"])
     => [["Sarah", "Engineering"], ["Sue", "Sales"], ["Sam", "HR"]] 
    > db.execute("SELECT DISTINCT department FROM employees")
     => [["Engineering"], ["Sales"], ["HR"]] 

There are a few things to notice.  Firstly, we need to load the `sqlite3` gem by calling `require "sqlite3"`.  We can then interact with the database by calling `SQLite3::Database.open(path_to_database)`.  This returns a `SQLite3::Database` object, and this object has an `execute` method that we can use to execute SQL commands and queries.

`execute` takes either one or two arguments.  The first argument is the SQL statement that is to be executed.  The statement may include question marks as placeholders for values, and if it does, `execute`s second argument is an array of the values that should be substituted into the statement in place of the placeholders.  So, a call to `db.execute("SELECT * FROM employees WHERE department = ?", ["Sales"])` will result in the following SQL being executed:

    SELECT * FROM employees WHERE department = "Sales";

`execute` returns an array of arrays.  Each subarray contains the data from a single row.  It's sometimes useful to find out from the database what the column headings of a table are.  One way to do this is with the `execute2` method, which is like `execute` except that it returns an additional subarray containing the column headings:

    > db.execute2("SELECT * FROM employees WHERE name LIKE ?", ["S%"])
     => [["name", "department"], ["Sarah", "Engineering"], ["Sue", "Sales"], ["Sam", "HR"]] 

The `sqlite3` library is well documented at http://www.rubydoc.info/github/luislavena/sqlite3-ruby/SQLite3/.

> Task: Write a function that takes the output of `execute2` as its input, and displays a table where the columns line up.  For instance, the output of the last query above should be displayed like this:

    name  | department
    ------+-------------
    Sarah | Engineering
    Sue   | Sales
    Sam   | HR

> Task: Write a function that takes the output of `execute2` as its input, and converts it from an array of arrays to an arrah of hashes.  Each hash should have column names for its keys, and the corresponding database values for the values.  For example, the output of the last query above should be converted to:

    [
      {'name' => 'Sarah', 'department' => 'Engineering',
      {'name' => 'Sue', 'department' => 'Sales',
      {'name' => 'Sam', 'department' => 'HR',
    ]

> Task: Write a function that takes as its input the array of hashes that is the output of the function from the previous task, and displays it in a table as described in the first task of this section.

> Exercise: In `exercises/bank`, there is a program called `bank.rb` that pretends to manage a bank account.  Read the code of `bank.rb` and try to understand what it does.  Run it from the command line a few times to try it out.  The project also has some cucumber features that you should try out.  One problem with the code is that it allows you to become overdrawn.  If you try to withdraw more money than is in your account, you should be given an error message.  Write a cucumber feature for this behaviour, and then change the code to make the feature pass.


### Making HTTP requests

Ruby's standard library doesn't come with a good HTTP library, so we're going to use a gem called `HTTParty` to make HTTP requests.  From the command line, you can install it with:

    gem install httparty

We can try out HTTParty from IRB:

    > require 'httparty'
     => true 
    > response = HTTParty.get('http://www.bbc.co.uk')
     => #<HTTParty::Response:0x7fe4f446f790 parsed_response=...

The representation of an HTTP response is very verbose.  There are methods we can call on an HTTP response object to tell us about the response.

We can easily get the status code:

    > response.code
     => 200 

Different status codes mean different things.  A 200 status code means that the request was successful while 404 means that the requested resource was not found.  There's a complete list at http://httpstatusdogs.com/.

We can easily access the content of an HTTP response:

    > rsp = HTTParty.get("http://httpbin.org/ip")
     => #<HTTParty::Response:0x7fe4f465a280 parsed_response={"origin"=>"62.255.172.126"}, @response=#<Net::HTTPOK 200 OK readbody=true>, @headers={"server"=>["nginx"], "date"=>["Tue, 20 Jan 2015 13:11:01 GMT"], "content-type"=>["application/json"], "content-length"=>["33"], "connection"=>["close"], "access-control-allow-origin"=>["*"], "access-control-allow-credentials"=>["true"]}> 
    > puts rsp.body
    {
      "origin": "62.255.172.126"
    }
     => nil 

In this case, the response contains JSON.  We can parse the JSON to get a Ruby hash:

    > require 'json'
     => false 
    > data = JSON.parse(rsp.body)
     => {"origin"=>"62.255.172.126"} 
    > data['origin']
     => "62.255.172.126" 

> Task: Go to http://httpbin.org/ in your browser, and learn about some of the HTTP endpoints (such as `/ip`) that are available.  Try to make GET requests to them with Ruby.

We can also inspect the body of a response to see whether it contains a certain string.  For instance, we can see whether there are any stories on a given topic on the BBC homepage.

    # examples/in_the_news.rb
    require "httparty"
    
    query = ARGV[0]
    
    response = HTTParty.get("http://www.bbc.co.uk")
    
    if response.body.include?(query)
      puts "There is a story about #{query} on the BBC homepage today"
    else
      puts "There is no story about #{query} on the BBC homepage today"
    end

Depending on what's in the news, you might see something like this:

    $ ruby in-the-news.rb Arsenal
    There is a story about Arsenal on the BBC homepage today
    $ ruby in-the-news.rb Chelsea
    There is no story about Chelsea on the BBC homepage today

If you want to do more complicated parsing of the HTML in the body of an HTTP response, you should use a library called Nokogiri.  However, that is beyond the scope of this course.


### More about handling JSON

Services often make data available via an HTTP API.  We'll look at how Spotify, the music streaming service, makes available metadata about their music via their API.  The API is documented in detail at https://developer.spotify.com/web-api/.

Spotify's data model consists of three main types of object: an artist, an album, and a track.  An artist will have many albums, each of which will have many tracks.  Additionally, a track may have many artists.  Each artist, album, and track has a unique identifier, which is a string of like `0fLVm67GzAJpbqX8GUL7G6`.

Spotify allows us to search for artists, albums, and tracks.  Let's try to search for information about the band Oasis.  To do this, we have to make a GET request to a URL like `https://api.spotify.com/v1/search?type=artist&q=oasis`.

> Task: Go to this URL in your browser, and try to work out what you're looking at.

Note that the URL has a querystring, with parameters `type` and `q`.  We can tell HTTParty to add a querystring to a GET request with the following syntax:

    > rsp = HTTParty.get('https://api.spotify.com/v1/search?', :query => {'type' => 'artist', 'q' => 'oasis'})
     => #<HTTParty::Response:...

We know, from making the request in the browser, that the body of the response is JSON, so let's parse this to get some Ruby objects that we can play with.

    > data = JSON.parse(rsp.body)
     => {"artists"=>{"href"=>"https://api.spotify.com/v1/search?query=oasis&offset=0&limit=20&type=artist", ...

What is `data`?  It looks like a hash, but we can make sure:

    > data.class
     => Hash 

It turns out it is a hash with just one key, whose value is also a hash:

    > data.keys
     => ["artists"] 
    > data["artists"].class
     => Hash 
    > data["artists"].keys
     => ["href", "items", "limit", "next", "offset", "previous", "total"] 

The most interesting value in this hash belongs to `"items"`:

    > data["artists"]["items"].class
     => Array 
    > items = data["artists"]["items"]
     => [{"external_urls"=>{"spotify"=>"https://open.spotify.com/artist/2DaxqgrOhkeH0fpeiQq2f4"}, ...

We've assigned `data['artists']['items']` to the name `items` to make it easier to work with.  `items` is an array of hashes, where each hash corresponds to a search result.  Because we've searched for artists, each hash corresponds to an artist.  Let's look at the first result.

    > items[0].class
     => Hash 
    > items[0].keys
     => ["external_urls", "followers", "genres", "href", "id", "images", "name", "popularity", "type", "uri"] 
    > items[0]["type"]
     => "artist" 
    > items[0]["name"]
     => "Oasis" 
    > items[0]["href"]
     => "https://api.spotify.com/v1/artists/2DaxqgrOhkeH0fpeiQq2f4" 

It looks like `items[0]` might contain data about the band we're looking for, but we need some more information to be sure, since there might be another Oasis.  `items[0]["href"]` is a URL, which we can make a request to to find out more about this artist.

    > rsp = HTTParty.get('https://api.spotify.com/v1/artists/2DaxqgrOhkeH0fpeiQq2f4')
     => #<HTTParty::Response: ...
    > data = JSON.parse(rsp.body)
     => {"external_urls"=> ...

`data` now refers to a hash with data about an artist.  It turns out this matches the value of `items[0]`, so we haven't gained any more information by following this link.  (I think the Spotify API is currently slightly broken -- I'm sure it used to return more.)  However, by reading the documentation, we see that we can access a list of an artist's albums at the following URL: `https://api.spotify.com/v1/artists/[id]/albums?album_type=album`.  So let's see what get when make a request to that URL:

    > rsp = HTTParty.get('https://api.spotify.com/v1/artists/2DaxqgrOhkeH0fpeiQq2f4/albums', :query => {'album_type' => 'album'})
     => #<HTTParty::Response ...
    > data = JSON.parse(rsp.body)
     => {"href"=> ...

The response is again JSON, which when parsed gives us a hash:

    > data.class
     => Hash
    > data.keys
     => ["href", "items", "limit", "next", "offset", "previous", "total"] 
    > data["items"][0].class
     => Hash 
    > data["items"][0].keys
     => ["album_type", "available_markets", "external_urls", "href", "id", "images", "name", "type", "uri"] 
    > data["items"][0]["name"]
     => "(What's The Story) Morning Glory? [Remastered]"

It's pretty clear now that we've found the Oasis we were looking for!
