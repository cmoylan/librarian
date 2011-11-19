Bookshelf = (args) ->
  # Elements
  availableBookshelves = $('#assignedBookshelves')
  map = $('#locationMap')
  bookshelfJSON = $('#bookshelf_location_json')[0]

  # Functions
  handleClick = (event) ->
    console.log('boom')
    # TODO: event delegation
    elm = $(event.target)

    if elm.hasClass('bookshelfName')
      bookshelfId = elm.attr('data-bookshelf_id')

      # If the bookshelves box is already present, do nothing.
      # Determine this using data-bookshelf_id
      boxId = '#bookshelfPlacementBox'
      if $(boxId).length > 0
        console.log('out there')
        return

      # TODO: break this out into its own function
      # TODO: add bookshelf name to box
      # Add the bookshelf placement div to the map
      placementBox = document.createElement('div')
      placementBox.id = boxId.replace(/#/, '')
      placementBox.setAttribute('data-bookshelf_id', bookshelfId)
      map.append(placementBox)

      $(boxId).draggable({
        containment: map
        stop: recordPosition
      })
      $(boxId).resizable({
        stop: recordPosition
      })


  recordPosition = (event, elm) ->
    bookshelfId = elm.helper.attr('data-bookshelf_id')
    elmWidth = elm.helper.context.offsetWidth
    elmHeight = elm.helper.context.offsetHeight

    x1 = elm.position.left
    y1 = elm.position.top
    x2 = x1 + elmWidth
    y2 = y1 + elmHeight

    # Assume json will always be present
    bookshelfCoords = jQuery.parseJSON(bookshelfJSON.value)
    bookshelfCoords[bookshelfId] = {
      'x1': x1,
      'y1': y1,
      'x2': x2,
      'y2': y2,
    }

    bookshelfJSON.value = JSON.stringify(bookshelfCoords)


  initBookshelves = ->
    # TODO: position all of the bookshelves when the page loads
    # For each bookshelf create a draggable/resizeable element
    # That is, if the bookshelf has already been positioned
    # Otherwise, do nothing
    console.log(window.bookshelves_json)


  # Listeners
  availableBookshelves.bind('click', handleClick)

  initBookshelves()



$(document).ready ->
  Bookshelf()
