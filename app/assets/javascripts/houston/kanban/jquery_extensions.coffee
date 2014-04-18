$.fn.extend
  
  popoverForTicket: ->
    $queue = $(@).closest('ul')
    queue = $queue.attr('id')
    placement = if queue in ['staged_for_testing', 'in_testing', 'in_testing_production'] then 'left' else 'right'
    is_manual_queue = $queue.closest('.kanban-column').hasClass('manual')
    $(@).popover
      placement: placement
      title: -> 
        $(@).attr('data-project')
      content: ->
        content = $(@).find('.ticket-summary').html().split(': ')
        content = if content[1] then "<strong>#{content[0]}: </strong>#{content[1]}" else content[0]
        if is_manual_queue then content + '<span class="remove-instructions">Shift + Click to remove</span>' else content
