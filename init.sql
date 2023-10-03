create table "user"
(
    id          serial
        constraint user_pk
            primary key,
    password    varchar not null,
    name        varchar,
    email       varchar not null
        constraint name_unique
            unique,
    date_joined varchar,
    image_path  varchar
);

alter table "user"
    owner to postgres;

create table film
(
    id              serial
        constraint film_pk
            primary key,
    name            varchar,
    description     text,
    duration        varchar,
    preview_path    varchar,
    media_path      varchar,
    country         varchar,
    release_year    integer,
    rating          double precision,
    rates_count     integer,
    age_restriction integer
);

alter table film
    owner to postgres;

create table artist
(
    id          serial
        constraint artist_pk
            primary key,
    name        varchar,
    birth_date  date,
    death_date  date,
    birth_place varchar,
    image_path  varchar
);

alter table artist
    owner to postgres;

create table "artist-film"
(
    artist_id serial
        constraint "artist-film_fk0"
            references artist,
    film_id   serial
        constraint "artist-film_fk1"
            references film
);

alter table "artist-film"
    owner to postgres;

create table genre
(
    id   serial
        constraint genre_pk
            primary key,
    name varchar
);

alter table genre
    owner to postgres;

create table genre_film
(
    genre_id integer
        constraint "genre-film_fk0"
            references genre,
    film_id  integer
        constraint "genre-film_fk1"
            references film
);

alter table genre_film
    owner to postgres;

create table series
(
    id              serial
        constraint series_pk
            primary key,
    name            varchar,
    description     text,
    duration        interval,
    preview_path    varchar,
    media_path      varchar,
    country         varchar,
    release_year    integer,
    rating          integer,
    rates_count     integer,
    age_restriction integer
);

alter table series
    owner to postgres;

create table "genre-series"
(
    genre_id  integer
        constraint "genre-series_fk0"
            references genre,
    series_id integer
        constraint "genre-series_fk1"
            references series
);

alter table "genre-series"
    owner to postgres;

create table session
(
    token      uuid not null
        constraint session_pk
            primary key,
    expires_at timestamp,
    user_id    integer
);

alter table session
    owner to postgres;

create table series_estimation
(
    user_id   integer
        constraint series_estimation_fk0
            references "user",
    series_id integer
        constraint series_estimation_fk1
            references series,
    rate      double precision
);

alter table series_estimation
    owner to postgres;

create table film_estimation
(
    user_id   integer
        constraint film_estimation_fk0
            references "user",
    series_id integer
        constraint film_estimation_fk1
            references series,
    rate      double precision
);

alter table film_estimation
    owner to postgres;

create table episode
(
    id          serial
        constraint episode_pk
            primary key,
    series_id   integer
        constraint episode_fk0
            references series,
    description text,
    number      integer,
    name        varchar
);

alter table episode
    owner to postgres;

