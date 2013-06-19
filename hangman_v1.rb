class Hangman
	
	CHOICE_OPTIONS = %w(Toronto Brampton Mississauga Markham Scarborough Oshawa Pickering Hamilton Burlington Oakville Orangeville)

	attr_accessor :word_choice, :chances, :board, :choice_options, :attempts, :answer

	def initialize()
		@word_choice 	= CHOICE_OPTIONS.sample
		@board		= create_board(@word_choice)
		@attempts	= []
		@chances	= 8
	end

	def attempts
		@attempts.join(", ")
	end

	def create_board(word_choice)
		board = '_' * word_choice.length
	end

	def letter_selection(letter_choice)
		@word_choice.include? letter_choice
	end

	def letter_appears_on_board(letter_choice)
		for choice in (0...@word_choice.length)
		if @word_choice[choice] == letter_choice
			@board[choice] = letter_choice
		end
		end
	end

	def incorrect_letter_choice(letter_choice)
		@attempts << letter_choice
		@chances -= 1
	end

	def attempt(letter_choice)
		if letter_selection(letter_choice)
			letter_appears_on_board(letter_choice)
		else
			incorrect_letter_choice(letter_choice) if !@attempts.include? letter_choice
		end
	end

	def victorious?
		if @board.include?('_') == false
			return true
		else
			return false
		end
	end

	def defeat?
		if @chances == 0
			return true
		else
			return false
		end
	end
end