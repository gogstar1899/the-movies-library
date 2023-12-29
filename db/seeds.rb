movies = [
  {name: "The Shawshank Redemption", year: 1994, director: "Frank Darabont", main_actor: "Tim Robbins"},
  {name: "The Godfather", year: 1972, director: "Francis Ford Coppola", main_actor: "Marlon Brando"},
  {name: "The Dark Knight", year: 2008, director: "Christopher Nolan", main_actor: "Christian Bale"},
  {name: "Pulp Fiction", year: 1994, director: "Quentin Tarantino", main_actor: "John Travolta"},
  {name: "Fight Club", year: 1999, director: "David Fincher", main_actor: "Brad Pitt"},
  {name: "Forrest Gump", year: 1994, director: "Robert Zemeckis", main_actor: "Tom Hanks"},
  {name: "Inception", year: 2010, director: "Christopher Nolan", main_actor: "Leonardo DiCaprio"},
  {name: "The Matrix", year: 1999, director: "Lana Wachowski, Lilly Wachowski", main_actor: "Keanu Reeves"},
  {name: "The Lord of the Rings: The Fellowship of the Ring", year: 2001, director: "Peter Jackson", main_actor: "Elijah Wood"},
  {name: "Star Wars: Episode V - The Empire Strikes Back", year: 1980, director: "Irvin Kershner", main_actor: "Mark Hamill"}
]

movies.each do |movie_data|
  Movies.create(movie_data)
end