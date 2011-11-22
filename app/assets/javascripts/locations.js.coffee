Bookshelf = (args) ->
  # Elements
  availableBookshelves = $('#assignedBookshelves')
  map = $('#locationMap')
  bookshelfJSONId = '#bookshelf_location_json'

  # Functions
  handleClick = (event) ->
    console.log('handling click')
    elm = $(event.target)

    if elm.hasClass('bookshelfName')
      bookshelfId = elm.attr('data-bookshelf_id')
      initPlacementBox(bookshelfId)


  initPlacementBox = (bookshelfId, coords) ->
    # If the bookshelves box is already present, do nothing.
    # Determine this using data-bookshelf_id
    boxId = '#bookshelfPlacementBox-' + bookshelfId
    if $(boxId).length > 0
      console.log('out there')
      return

    # TODO: add bookshelf name to box
    # Add the bookshelf placement div to the map
    placementBox = document.createElement('div')
    placementBox.id = boxId.replace(/#/, '')
    placementBox.className = 'placementBox'
    placementBox.setAttribute('data-bookshelf_id', bookshelfId)
    map.append(placementBox)

    $(boxId).draggable({
      containment: map
      stop: recordPosition
    })
    $(boxId).resizable({
      stop: recordPosition
    })

    # TODO: if coords are passed in, do a bunch of math and position the box
    #console.log($(boxId).position())


  recordPosition = (event, elm) ->
    bookshelfId = elm.helper.attr('data-bookshelf_id')
    elmWidth = elm.helper.context.offsetWidth
    elmHeight = elm.helper.context.offsetHeight

    x1 = elm.position.left
    y1 = elm.position.top
    x2 = x1 + elmWidth
    y2 = y1 + elmHeight

    # Assume json will always be present
    bookshelfCoords = jQuery.parseJSON($(bookshelfJSONId)[0].value)
    bookshelfCoords[bookshelfId] = {
      'x1': x1,
      'y1': y1,
      'x2': x2,
      'y2': y2,
    }

    $(bookshelfJSONId)[0].value = JSON.stringify(bookshelfCoords)


  initBookshelves = (bookshelves) ->
    # TODO: position all of the bookshelves when the page loads
    # For each bookshelf create a draggable/resizeable element
    # That is, if the bookshelf has already been positioned
    # Otherwise, do nothing
    console.log(bookshelves)
    for bookshelf in bookshelves
      do (bookshelf) ->
        bookshelf = bookshelf['bookshelf']
        #initPlacementBox(bookshelf.id)
        console.log(bookshelf)


  # Defining this on the window class so it can be access from elsewhere
  window.updatePositions = ->
    data = $(bookshelfJSONId)[0].value
    console.log(data)
    #jQuery.post('/bookshelves/update_positions', data)
    jQuery.ajax({
      type: 'POST',
      url: '/bookshelves/update_positions',
      data: {
        positions: data
      }
    })


  # Listeners
  availableBookshelves.bind('click', handleClick)

  # Initializer
  initBookshelves(window.bookshelves_json)
  window.initBookshelves = initBookshelves


$(document).ready ->
  Bookshelf()

