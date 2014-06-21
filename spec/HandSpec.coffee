expect = chai.expect
assert = chai.assert

describe 'Hand', ->
  hand = null
  describe 'Dealer', ->
    beforeEach ->
      deck = new Deck()
      hand = deck.dealDealer()
      sinon.spy(hand, 'trigger')

    it "dealer score is greater than or equal to 17", ->
      hand.play()
      assert.equal(hand.calcScore() > 16, true)
    it "on play dealer triggers ended", ->
      hand.play()
      expect(hand.trigger).to.have.been.calledWith('ended', hand)
