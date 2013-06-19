require_relative "hangman_v1"

class HangmanRunner

	def self.run 
		@game = Hangman.new()
		while true
			puts "\nBoard: #{@game.board}\n\n"
			puts "Attempted letters: #{@game.attempts}\n\n"
			puts "Chances: #{@game.chances}\n\n"
			puts "Words will consist of Ontarian cities. Make your move: "
			letter_choice = gets.chomp
			@game.attempt(letter_choice)
			if @game.victorious?
				puts "\n\n Victory is yours. Celebrate merrily hereafter.\n"
				break
			elsif @game.defeat?
				puts "\n\nYou have been defeated. The word was #{@game.word_choice}. Restart your education promptly at the primary level.\n"
				break
			end
			puts"=================================================================================\n"
		end
	end
end

HangmanRunner.run