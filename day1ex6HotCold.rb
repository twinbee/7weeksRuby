# hot - cold exercise

# Bonus problem: Pick a random number and have the user guess
# the number. When the guess, if incorrect, tell them if they
# are too high or too low.

puts "Please enter your name"

gets()

puts "Ok, your name is Bisquick!"

puts "I am thinking of a number between 1 and 100"
targetNumber = rand (100)

guess = gets().to_i()

while guess != targetNumber do 
    if (guess > targetNumber) 
		puts "Sorry you are too HIGH"
		
	else 
		puts "Sorry you are too LOW"  
	end
	
	guess =  gets().to_i()
end #while

puts "Congratumalations, Bisquick! But you still lose because you wasted your time on this."