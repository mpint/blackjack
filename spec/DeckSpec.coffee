assert = chai.assert

describe 'deck', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()
  
  describe 'exists', ->
    it 'should exist', ->
      assert.notStrictEqual deck, undefined

  describe 'hits', ->
    it "should give the last card from the deck", ->
      assert.strictEqual deck.length, 50
      assert.strictEqual deck.last(), hand.hit()
      assert.strictEqual deck.length, 49
      hand.playable && (assert.strictEqual deck.last(), hand.hit())
      hand.playable && (assert.strictEqual deck.length, 48)
  
  describe 'dealer mechanics', ->
    it 'should give the dealer a hand with the top card face up and bottom card face down', ->
      deck = new Deck()
      dealer = deck.dealDealer()
      assert.strictEqual deck.length, 50
      assert.strictEqual dealer.isDealer, true
      assert.strictEqual dealer.models[1].attributes.revealed, true
      assert.strictEqual dealer.models[0].attributes.revealed, false

