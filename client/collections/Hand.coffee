class window.Hand extends Backbone.Collection

  model: Card

  initialize: (array, @deck, @isDealer) ->
  # hit method removes a card from this.deck and adds to top (.last()) of this.hand
  hit: ->
    @add(@deck.pop()).last()


  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    hasAce = @reduce (memo, card) ->
      # return memo = memo || card === 1
      memo or card.get('value') is 1
    , false
    score = @reduce (score, card) ->
      score + if card.get 'revealed' then card.get 'value' else 0
    , 0
    if hasAce then [score, score + 10] else [score]

# ({
#   scores: function() {
#     var hasAce, score;
#     hasAce = this.reduce(function(memo, card) {
#       return memo || card.get('value') === 1;
#     }, false);
#     score = this.reduce(function(score, card) {
#       return score + (card.get('revealed') ? card.get('value') : 0);
#     }, 0);
#     if (hasAce) {
#       return [score, score + 10];
#     } else {
#       return [score];
#     }
#   }
# });