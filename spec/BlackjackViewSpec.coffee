expect = chai.expect

describe 'Blackjack View', ->
  app = null
  view = null
  beforeEach ->
    app = new App()
    view = new AppView({
      model: app
    })
  describe 'Check for clicks', ->
    it "player stands when stand clicked", ->
      sinon.spy Hand.prototype, 'stand'
      view.$el.find('.stand-button').click()
      playerHand = app.get('playerHand')
      expect(playerHand.stand).to.have.been.called
