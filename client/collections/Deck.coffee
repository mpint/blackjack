class window.Deck extends Backbone.Collection

  model: Card

  initialize: ->
    # makes 52 card deck (0-51)
    @add _([0...52]).shuffle().map (card) ->
      # shuffles and creates card identities
      new Card
        rank: card % 13
        suit: Math.floor(card / 13)
  # deals two card hand to player
  dealPlayer: -> new Hand [ @pop(), @pop() ], @
  # deals two card hand to dealer and flips top card
  # Hand( [card 1, card 2], context = this, isDealer = true )
  dealDealer: -> new Hand [ @pop().flip(), @pop() ], @, true
