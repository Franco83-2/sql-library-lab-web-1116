def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT books.title, books.year FROM books
  WHERE books.series_id = 1
  ORDER BY year"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT name, motto FROM characters
  WHERE motto = (SELECT motto FROM characters ORDER BY LENGTH(motto) DESC LIMIT 1)"
end

def select_value_and_count_of_most_prolific_species
  "SELECT species, COUNT(*) FROM characters 
  GROUP BY species 
  ORDER BY COUNT(*) DESC
  LIMIT 1"
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name, subgenres.name FROM authors
  JOIN characters
  ON authors.id = characters.author_id
  JOIN series
  ON characters.series_id = series.id
  JOIN subgenres
  ON series.subgenre_id = subgenres.id
  GROUP BY authors.name"
end

def select_series_title_with_most_human_characters
  "SELECT series.title FROM series
  WHERE series.id = (
    SELECT series_id FROM characters
    WHERE species = 'human'
    GROUP BY series_id
    ORDER BY COUNT(*) DESC
    LIMIT 1)"
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT characters.name, COUNT(characters.name) FROM characters
  JOIN character_books
  ON characters.id = character_books.character_id
  JOIN books
  ON character_books.book_id = books.id
  GROUP BY characters.name 
  ORDER BY COUNT(characters.name) DESC;"
end
