/*Queries that provide answers to the questions from all projects.*/
/*all animals whose name ends in "mon".*/
 SELECT * FROM animals WHERE name LIKE '%mon%';
/* the name of all animals born between 2016 and 2019. */
 SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-1-1' AND '2019-12-31' ;
 /* the name of all animals that are neutered and have less than 3 escape attempts. */
  SELECT name FROM animals WHERE neutered=TRUE AND  escape_attempts<3;
 /*the date of birth of all animals named either "Agumon" or "Pikachu".*/
  SELECT date_of_birth FROM animals WHERE name='Agumon' OR  name='Pikachu';
/* name and escape attempts of animals that weigh more than 10.5kg */
SELECT name,escape_attempts FROM animals WHERE weight_kg>10.5;
/* all animals that are neutered. */
 SELECT * FROM animals WHERE neutered=TRUE;
 /* all animals not named Gabumon. */
  SELECT * FROM animals WHERE NOT name='Gabumon';
  /* all animals with a weight between 10.4kg and 17.3kg */
   SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

     

    BEGIN TRANSACTION;
    update animals set species = 'unspecified';
    ROLLBACK;
    
    BEGIN TRANSACTION;
    update animals set species = 'digimon' where name LIKE '%mon%';
    update animals set species = 'pokemon' where species='';
    select species from animals;
    COMMIT;
    select species from animals;

    BEGIN TRANSACTION;
    delete from animals;
    select * from animals;
    ROLLBACK;
    select * from animals;

    BEGIN TRANSACTION;
    delete from animals where date_of_birth > '2022-01-01';
    savepoint s1;
    update animals set weight_kg = weight_kg * -1;
    ROLLBACK to s1;
    update animals set weight_kg = weight_kg * -1 where weight_kg<0;
    commit;
  
   /* total animals */
    select count(id) from animals;
    /* animals that have never tried to escape */
    select count(id) from animals where escape_attempts = 0;
    /* the average weight of animals */
    select avg(weight_kg) from animals;
    /* escapes the most, neutered or not neutered animals? */
     select avg(escape_attempts) from animals;
     select name, neutered from animals where escape_attempts = 7;
     /* The minimum and maximum weight of each type of animal */
     select species,min(weight_kg) from animals group by species;
     select species,max(weight_kg) from animals group by species;
     /* the average number of escape attempts per animal type of those born between 1990 and 2000 */
      select species,avg(escape_attempts) from animals where date_of_birth between '1990-01-01' and '2000-01-01'  group by species;

    /* Melody Pond's */
      select name,full_name
      from animals
      join owners
      on animals.owner_id = owners.id where owners.full_name='Melody Pond';
      
      /* pokemon list */
       select animals.name as animal , species.name as type
       from animals
       join species
       on animals.species_id = species.id where species.name = 'Pokemon';

    /* number of animals of per species */
      select species.name, count(animals.id)
      from animals
      join species
      on animals.species_id = species.id group by species.name;
    /* owner and animal */
      select owners.full_name, animals.name
      from owners
      left join animals
      on animals.owner_id = owners.id;

     /* all Digimon owned by Jennifer Orwell. */
       select animals.name as animal, species.name as type, owners.full_name as owner
       from species
       join animals on animals.species_id = species.id
       join owners on animals.owner_id = owners.id
       where species.name = 'Digimon' and owners.full_name ='Jennifer Orwell'; 
     
     /*  */
      select animals.name
      from animals
      join owners
      on animals.owner_id = owners.id
      where animals.escape_attempts=0 and owners.full_name = 'Dean Winchester';

       /*Who owns the most animals? */
       select owners.full_name
       from owners
       join (
       select owner_id, COUNT(*) as animal_count
       from animals
       group by owner_id
      ) as owner_counts on owners.id = owner_counts.owner_id
       where owner_counts.animal_count = (
       select MAX(animal_count)
       from (
       select COUNT(*) AS animal_count
       from animals
       group by owner_id
     ) as max_counts
);

/* the last animal seen by William Tatcher */
select animal_name,vets_name,date from visits
where date = (select max(date) from visits where vets_name='William Tatcher');
/* the number of animals Stephanie Mendez saw*/
 select count(animal_name) from visits where vets_name ='Stephanie Mendez';

 /* vets and their specialties, including vets with no specialties.*/
  select coalesce(vet_name,name),species_name
  from specializations
  full outer join vets
  on vet_name = name;

/*all animals that visited Stephanie Mendez between April 1st and August 30th, 2020. */
  select animal_name from visits 
  where vets_name = 'Stephanie Mendez' and date between ' 2020-04-01'
  and ' 2020-08-30'
/* animal that has the most visits to vets*/
  select animal_name, COUNT(animal_name) as visit_count
  from visits
  group by animal_name
  order by visit_count desc
  limit 1;

/*  Maisy Smith's first visit */
 select animal_name,date from visits
 where date = (select min(date) from visits where vets_name = 'Maisy Smith');


 select v.animal_name,a.escape_attempts,a. weight_kg,a.neutered,
 a.date_of_birth,species.name as type, o.full_name as owner,vets.name as vet, vets. date_of_graduation,vets.age, s.species_name as specialization, v.date as date_of_visit
 from owners o
 join animals a
 on a.owner_id = o.id
 join species
 on species.id = a.species_id
 join visits v
 on a.name=v.animal_name
 join vets
 on vets.name = v.vets_name
 join specializations s
 on vets.name = s.vet_name
 where v.date = (select max(date) from visits);

  select count (vets_name), vets_name from visits
  where vets_name = (select name from vets
  left join specializations s
  on vets.name = s.vet_name
  where species_name ='' or species_name is null)
  group by vets_name;

  select count (animal_name),animal_name from visits
  where vets_name = 'Maisy Smith'
  group by animal_name;

  select max(animal_count) OVER (), name  from (
  select count (animal_name) as animal_count, animal_name as name from visits
  where vets_name = 'Maisy Smith'
  group by animal_name) as animalcounting
  LIMIT 1;
