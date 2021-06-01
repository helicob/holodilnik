create table language(
	language_id serial primary key,
	language varchar (50) unique not null
)

create table nationality(
	nationality_id serial primary key,
	nationality varchar (50) unique not null
)

create table country(
	country_id serial primary key,
	country varchar (50) unique not null
)

create table language_nationality(
	language_id int not null,
	nationality_id int not null,
	primary key (language_id, nationality_id),
	foreign key (language_id) references language (language_id),
	foreign key (nationality_id) references nationality (nationality_id)
)

create table nationality_country(
	nationality_id int not null,
	country_id int not null,
	primary key (nationality_id, country_id),
	foreign key (nationality_id) references nationality (nationality_id),
	foreign key (country_id) references country (country_id)
)

insert into language (language) values ('english')

insert into language (language) select unnest (array['german', 'russian', 'french', 'spanish'])

insert into country (country) select unnest (array['Germany', 'Russia', 'France', 'Spanin', 'USA'])

insert into nationality (nationality) select unnest (array['german', 'russian', 'frenchman', 'hispanic', 'mexican'])

insert into language_nationality (language_id, nationality_id) select unnest (array[2, 3, 4, 5, 5]), unnest (array[1, 2, 3, 4, 5])

insert into nationality_country (nationality_id, country_id) select unnest (array[1, 1, 2, 2, 3, 3, 4, 4, 5, 5]), unnest (array[1, 5, 2, 5, 3, 5, 4, 5, 5, 5])