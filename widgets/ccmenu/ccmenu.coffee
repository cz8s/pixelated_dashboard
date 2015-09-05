class Dashing.Ccmenu extends Dashing.Widget

  onData: (data) ->
    console.log data.color
    if data.color
      # clear existing "status-*" classes
      $(@get('node')).attr 'class', (i,c) ->
        c.replace /\bstatus-\S+/g, ''
      # add new class
      $(@get('node')).addClass "status-#{data.color}"
