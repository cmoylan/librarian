namespace :db do
  desc "Erase and fill the database with development data"
  task :populate => :environment do
    require 'populator'
    require 'faker'

    [Book, Bookshelf].each(&:delete_all)

    Bookshelf.populate 5 do |bookshelf|
      bookshelf.name = Populator.words(1..3)
      bookshelf.description = Populator.sentences(2..4)
      bookshelf.shelves = 1..6

      Book.populate 10..100 do |book|
        book.bookshelf_id = bookshelf.id
        book.isdn = 1000000000..9999999999
        book.title = Populator.words(1..6).titleize
        book.author = Faker::Name.name
        book.shelf = 1..bookshelf.shelves
      end

    end
  end
end

