-- DROP DATABASE IF EXISTS wadhw; 

CREATE DATABASE wadhw TEMPLATE template0
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_Europe.1252'
    LC_CTYPE = 'English_Europe.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

DROP TABLE IF EXISTS public.posts;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE public.posts (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    title text NOT NULL,
    body text NOT NULL,
    likes integer NOT NULL DEFAULT 0,
    datetime timestamp WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT prim_key PRIMARY KEY (id) 
);