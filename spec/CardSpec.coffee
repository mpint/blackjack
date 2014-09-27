assert = chai.assert

describe "deck constructor aka Card", ->

  it "should create a card collection", ->
    collection = new Deck()
    assert.strictEqual collection.length, 52
  it 'should be able to flip cards', ->
    collection = new Deck()
    flipCard = collection.models[0].flip()
    flippedCard = collection.models[0].attributes.revealed
    assert.strictEqual flippedCard, false
    flipCard = collection.models[0].flip()
    flippedCard = collection.models[0].attributes.revealed
    assert.strictEqual flippedCard, true
    
