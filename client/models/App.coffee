#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    @get('playerHand').on('stand', (hand) =>
      @get('dealerHand').play()
    )

    @get('dealerHand').on('ended', (hand) =>
      # Declare Winner & other stuff
      @getWinner()
    )

  getWinner: ->
    playerScore = @get('playerHand').calcScore()
    dealerScore = @get('dealerHand').calcScore()
    console.log(playerScore, dealerScore)
    if playerScore < dealerScore && dealerScore <= 21
      alert "You Lost with #{playerScore}"
    else alert "You Won with #{playerScore}"



