# The **Bookshelf** closure manages the positioning of Bookshelves within
# a Location.
Bookshelf = (args) ->
  # Elements
  # --------
  # Set up some selectors that will be useful to multiple subfunctions within
  # the closure.
  availableBookshelves = $('#assignedBookshelves')
  map = $('#locationMap')
  bookshelfJSONId = '#bookshelf_location_json'

  # Functions
  # ---------
  # Define subfunctions
  handleClick = (event) ->
    elm = $(event.target)

    # Delegate to the `placementBox` function
    if elm.hasClass('bookshelfName')
      bookshelfId = elm.attr('data-bookshelf_id')
      initPlacementBox(bookshelfId)


  # Position a bookshelf within a location. If coordinates are passed in,
  # initialize the bookshelf at those coordinates.
  initPlacementBox = (bookshelfId, coords) ->
    # If the bookshelves box is already present, do nothing.
    # Determine this using data-bookshelf_id
    boxId = '#bookshelfPlacementBox-' + bookshelfId
    if $(boxId).length > 0
      return

    # TODO: add bookshelf name to box
    # Add the bookshelf placement div to the map
    placementBox = document.createElement('div')
    placementBox.id = boxId.replace(/#/, '')
    placementBox.className = 'placementBox'
    placementBox.setAttribute('data-bookshelf_id', bookshelfId)

    # If coordinates are passed in, position the bookshelf appropriately on the
    # map. Do some math to get width/height from x2/y2.
    if (coords)
      placementBox.style.position = 'absolute'
      placementBox.style.left = coords.x1 + 'px'
      placementBox.style.top = coords.y1 + 'px'
      placementBox.style.width = (coords.x2 - coords.x1) + 'px'
      placementBox.style.height = (coords.y2 - coords.y1) + 'px'

    map.append(placementBox)

    # Initialize jQueryUI draggable and resizeable on the placementBox. Keep it
    # contained within the map.
    $(boxId).draggable({
      containment: map
      stop: recordPosition
    })
    $(boxId).resizable({
      stop: recordPosition
    })


  # After a bookshelf has been positioned or resized, record it's coordinates.
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

    # Replace the old JSON string with the new one containing the updated
    # position. This is stored in a hidden input so that it can be submitted to
    # the server for processing/storage.
    $(bookshelfJSONId)[0].value = JSON.stringify(bookshelfCoords)

    # Send the new placement and coordinates back to the server.
    updatePositions()


  initBookshelves = (bookshelves) ->
    # Create a draggable/resizable element representing a bookshelf within the
    # map element.
    for bookshelf in bookshelves
      do (bookshelf) ->
        bookshelf = bookshelf['bookshelf']
        initPlacementBox(bookshelf.id, {
          x1: bookshelf.x1
          y1: bookshelf.y1
          x2: bookshelf.x2
          y2: bookshelf.y2
        })


  # Send an ajax request back to Rails with the new bookshelf placement hash.
  # TODO: do not hardcode the URL here
  updatePositions = ->
    data = $(bookshelfJSONId)[0].value
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


$(document).ready ->
  Bookshelf()

