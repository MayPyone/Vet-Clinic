/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(300),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg NUMERIC(4,2)
);

alter table animals add species varchar(200);

create table owners(id SERIAL PRIMARY KEY,
 full_name varchar (300),
 age INT);

 create table species (id serial primary key,
 name varchar(200));

/*id is set up as a primary key and autoincremented value has been already set up */
 alter table animals
 add constraint animals_pkey primary key (id);
/* remove species column*/
 alter table animals
 drop column species;

 alter table animals
 add column species_id int;
 /* Add column species_id which is a foreign key referencing species table */
 alter table animals
 add constraint fk_species foreign key (species_id) references species(id);
 
/*Add column owner_id which is a foreign key referencing the owners table */
  alter table animals
  add column owner_id int,
  add constraint fk_owner foreign key(owner_id) references owners(id);

  create table vets (
  id INT GENERATED ALWAYS AS IDENTITY,
  name varchar (300),
  age int,
  date_of_graduation date,
  primary key (id));

  create table specializations (
  specialization_id int generated always as identity,
  vet_id int,
  species_id int,
  vet_name varchar(300),
  species_name varchar(200),
  constraint pk_specialization primary key(specialization_id),
  constraint fk_vet foreign key(vet_id) references vets(id),
  constraint fk_species foreign key (species_id) references species(id));

  create table visits (
  vets_name varchar(300),
  animal_name varchar(200),
  date date);