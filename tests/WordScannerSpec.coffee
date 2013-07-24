describe "WordScanner", ->

	it "removes \\r", ->
		wscanner = new WordScanner("Ivan\r\nBilon")
		expect(wscanner.text).toEqual("Ivan\nBilon")

	describe "next() method", ->
		wscanner = null
		text = "Lorem Ipsum\nDolor"

		beforeEach ->
			wscanner = new WordScanner(text)

		it "is working correctly", ->
			expect(wscanner.next()).toEqual("Lorem")
			expect(wscanner.next()).toEqual(" ")
			expect(wscanner.next()).toEqual("Ipsum")
			expect(wscanner.next()).toEqual("\n")
			expect(wscanner.next()).toEqual("Dolor")
			expect(wscanner.next()).toEqual(null)

	describe "hasNext() method", ->
		wscanner = null

		beforeEach ->
			wscanner = new WordScanner("ivan bilon")

		it "is working fine", ->
			expect(wscanner.hasNext()).toBeTruthy()
			wscanner.next()
			expect(wscanner.hasNext()).toBeTruthy()
			wscanner.next()
			expect(wscanner.hasNext()).toBeTruthy()
			wscanner.next()
			expect(wscanner.hasNext()).toBeFalsy()
