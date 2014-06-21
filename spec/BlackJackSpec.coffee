expect = chai.expect

describe 'Blackjack', ->
  app = null
  beforeEach ->
    app = new App()
  describe 'Instantiates', ->
    it "should create a player Hand", ->
      expect(app.get('playerHand')).to.not.equal(undefined)
    it "should create a dealer Hand", ->
      expect(app.get('dealerHand')).to.not.equal(undefined)

