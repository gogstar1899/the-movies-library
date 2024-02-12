# frozen_string_literal: true

actors = [
  { name: 'Tim Robbins', birthdate: Date.strptime('16/10/1958', '%d/%m/%Y'),
    description: 'Tim Robbins is an American actor known for his roles in "The Shawshank Redemption" and "Mystic River". He is also a well-known director and musician.', oscar: true },
  { name: 'Marlon Brando', birthdate: Date.strptime('03/04/1924', '%d/%m/%Y'),
    description: 'Marlon Brando was an iconic American actor known for his roles in "The Godfather" and "A Streetcar Named Desire". He was also a significant activist for civil rights.', oscar: true },
  { name: 'Christian Bale', birthdate: Date.strptime('30/01/1974', '%d/%m/%Y'),
    description: 'Christian Bale is an English actor who is famous for his role in "The Dark Knight" and "American Psycho". He is known for his intense method acting style.', oscar: true },
  { name: 'John Travolta', birthdate: Date.strptime('18/02/1954', '%d/%m/%Y'),
    description: 'John Travolta is an American actor known for "Pulp Fiction" and "Grease". He is also a singer and dancer.', oscar: false },
  { name: 'Brad Pitt', birthdate: Date.strptime('18/12/1963', '%d/%m/%Y'),
    description: 'Brad Pitt is an American actor famous for "Fight Club" and "Inglourious Basterds". He is also a film producer, with his company Plan B Entertainment.', oscar: true },
  { name: 'Tom Hanks', birthdate: Date.strptime('09/07/1956', '%d/%m/%Y'),
    description: 'Tom Hanks is an American actor known for "Forrest Gump" and "Saving Private Ryan". He is also a filmmaker and known for his philanthropic work.', oscar: true },
  { name: 'Leonardo DiCaprio', birthdate: Date.strptime('11/11/1974', '%d/%m/%Y'),
    description: 'Leonardo DiCaprio is an American actor known for "Inception" and "Titanic". He is also an environmental activist.', oscar: true },
  { name: 'Keanu Reeves', birthdate: Date.strptime('02/09/1964', '%d/%m/%Y'),
    description: 'Keanu Reeves is a Canadian actor famous for "The Matrix" and "John Wick". He is also a musician.', oscar: false },
  { name: 'Elijah Wood', birthdate: Date.strptime('28/01/1981', '%d/%m/%Y'),
    description: 'Elijah Wood is an American actor known for "The Lord of the Rings". He is also a voice actor and DJ.', oscar: false },
  { name: 'Mark Hamill', birthdate: Date.strptime('25/09/1951', '%d/%m/%Y'),
    description: 'Mark Hamill is an American actor famous for "Star Wars". He is also a prolific voice actor.', oscar: false }
]

actor_records = actors.map do |actor_data|
  Actor.create!(actor_data)
end

movies = [
  { name: 'The Shawshank Redemption', year: 1994, director: 'Frank Darabont',
    main_actor: 'Tim Robbins',
    actor_id: (actor_records.find { |actor| actor.name == 'Tim Robbins' })&.id },
  { name: 'The Godfather', year: 1972, director: 'Francis Ford Coppola',
    main_actor: 'Marlon Brando',
    actor_id: (actor_records.find { |actor| actor.name == 'Marlon Brando' })&.id },
  { name: 'The Dark Knight', year: 2008, director: 'Christopher Nolan',
    main_actor: 'Christian Bale',
    actor_id: (actor_records.find { |actor| actor.name == 'Christian Bale' })&.id },
  { name: 'Pulp Fiction', year: 1994, director: 'Quentin Tarantino',
    main_actor: 'John Travolta',
    actor_id: (actor_records.find { |actor| actor.name == 'John Travolta' })&.id },
  { name: 'Fight Club', year: 1999, director: 'David Fincher',
    main_actor: 'Brad Pitt',
    actor_id: (actor_records.find { |actor| actor.name == 'Brad Pitt' })&.id },
  { name: 'Forrest Gump', year: 1994, director: 'Robert Zemeckis',
    main_actor: 'Tom Hanks',
    actor_id: (actor_records.find { |actor| actor.name == 'Tom Hanks' })&.id },
  { name: 'Inception', year: 2010, director: 'Christopher Nolan',
    main_actor: 'Leonardo DiCaprio',
    actor_id: (actor_records.find { |actor| actor.name == 'Leonardo DiCaprio' })&.id },
  { name: 'The Matrix', year: 1999, director: 'Lana Wachowski, Lilly Wachowski',
    main_actor: 'Keanu Reeves',
    actor_id: (actor_records.find { |actor| actor.name == 'Keanu Reeves' })&.id },
  { name: 'The Lord of the Rings: The Fellowship of the Ring', year: 2001, director: 'Peter Jackson',
    main_actor: 'Elijah Wood',
    actor_id: (actor_records.find { |actor| actor.name == 'Elijah Wood' })&.id },
  { name: 'Star Wars: Episode V - The Empire Strikes Back', year: 1980, director: 'Irvin Kershner',
    main_actor: 'Mark Hamill',
    actor_id: (actor_records.find { |actor| actor.name == 'Mark Hamill' })&.id }
]

movies.each do |movie_data|
  Movie.create!(movie_data)
end
