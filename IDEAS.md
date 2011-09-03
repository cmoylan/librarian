# Librian #

## How this will all work (I think): ##

+ Upload a floorplan - this is a 'location'

+ Each floorplan has none, one or many bookshelves
  - Bookshelves are placed over the floorplan with javascript
  - The user can drag to select a square area which will become the bookshelf
  - Only squares will be allowed
  - This feature is mostly useless but could be cool

+ Each bookshelf has none, one or many books
  - Books consist of a title and author
  - A background process will use this info to search for an ISDN (This is the 
    really cool part.)
  - If one is found, the rest of the book metadata can be loaded
  - Books should be able to be added via a CSV file, which is how I currently
    have mine documented.

+ Each book can have none or one checkout. The point of this is to keep track
  of which books are on loan.
  - Each checkout has a due date
  - There will probably be an email alert to remind us when due dates are 
    coming up so that we can bug whoever has our book to give it back.


