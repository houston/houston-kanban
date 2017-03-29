Handlebars.registerHelper 'classForAge', (seconds)->
  if seconds < (6 * Duration.HOUR)
    'infant'
  else if seconds < (2 * Duration.DAY)
    'child'
  else if seconds < (7 * Duration.DAY)
    'adult'
  else if seconds < (4 * Duration.WEEK)
    'senior'
  else if seconds < (26 * Duration.WEEK)
    'old'
  else
    'ancient'
