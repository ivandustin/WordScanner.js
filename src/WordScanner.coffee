class window.WordScanner
	constructor: (text) ->
		@text = text.replace("\r", "")
		@curPos = 0

	next: ->
		return null unless @curPos?

		word = ""
		letter = ""
		nextLetter = ""

		while true
			letter = @text[@curPos]
			word += letter

			if @curPos == @text.length - 1
				@curPos = null
				break
			else
				@curPos++

			break if letter == " " or letter == "\n"

			nextLetter = @text[@curPos]
			break if nextLetter == " " or nextLetter == "\n"

		return word


	hasNext: ->
		return if @curPos != null then true else false