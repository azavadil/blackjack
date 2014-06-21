class window.Hand extends Backbone.Collection

  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    @add(@deck.pop()).last()
    if @calcScore() > 21 then @trigger('bust', @)

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    hasAce = @reduce (memo, card) ->
      memo or card.get('value') is 1
    , false
    score = @reduce (score, card) ->
      score + if card.get 'revealed' then card.get 'value' else 0
    , 0
    if hasAce then [score, score + 10] else [score]
  stand: ->
    @trigger('stand', @)

  play: ->
    if not @isDealer then throw 'play called on player'
    # Reveal Cards
    @reveal()
    while (@calcScore() < 17)
      @hit()

    @trigger('ended', @)


  calcScore: ->
    scores = @scores()
    if scores.length == 1 then return scores[0]
    if scores[1] > 21 then scores[0] else scores[1]

  reveal: ->
    @each((card) ->
      if not card.get('revealed') then card.flip()
    )
