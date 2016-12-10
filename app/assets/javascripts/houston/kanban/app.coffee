window.App =

  toggleFullScreen: ->
    $body = $('body')

    $body.keypress (e)->
      if e.which is 102 # f
        $body.toggleClass('full-screen')
        window.location.hash = $body.attr('class')
        kanbanObj.setKanbanHeight() if window.kanbanObj # TMI: extract to event

    $body.keydown (e)->
      if e.keyCode is 27
        $body.removeClass('full-screen')
        window.location.hash = ''
        kanbanObj.setKanbanHeight() if window.kanbanObj # TMI: extract to event

    options = window.location.hash.substring(1).split(' ')
    if _.include(options, 'full-screen')
      $body.toggleClass('full-screen')
      kanbanObj.setKanbanHeight() if window.kanbanObj # TMI: extract to events
