Bookshelf = (args) ->
  # Elements
  availableBookshelves = $('#assignedBookshelves')
  map = $('#locationMap')

  # Functions
  handleClick = (event) ->
    # TODO: event delegation
    elm = $(event.target)

    if elm.hasClass('bookshelfName')
      # TODO: if the box is already out, do nothing
      boxId = '#bookshelfPlacementBox'
      if $(boxId).length > 0
        console.log('out there')
        return

      # TODO: break this out into its own function
      # TODO: add bookshelf name to box
      # Add the bookshelf placement div to the map
      placementBox = document.createElement('div')
      placementBox.id = boxId.replace(/#/, '')
      map.append(placementBox)

      # TODO: make this draggable
      $(boxId).draggable().resizable()


  initBookshelves = ->
    # TODO: position all of the bookshelves when the page loads


  # Listeners
  availableBookshelves.bind('click', handleClick)



$(document).ready ->
  Bookshelf()
