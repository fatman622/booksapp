$form = $('<%= j render("edit") %>').hide()
$books = $('#listing_books')
$books.after($form)
