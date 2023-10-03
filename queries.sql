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