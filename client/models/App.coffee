#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    # sets up Deck collection of Cards
    @set 'deck', deck = new Deck()
    # deals a hand to the player
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()