class window.Player extends Backbone.Model

  initialize: (params) ->
    @set
      chips: params.chips
      hand: params.hand


