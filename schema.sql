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