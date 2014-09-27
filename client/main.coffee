# instantiates AppView with an App Model
# appends to html documents body
window.init = ->
  $('body').empty();
  new AppView(model: new App()).$el.appendTo 'body'

init()