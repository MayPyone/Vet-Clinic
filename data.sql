/* Populate database with sample data. */

 INSERT INTO animals (name,date_of_birth,weight_kg,neutered,escape_attempts) VALUES
 ('Agumon','2020-2-3',10.23,TRUE,0),
 ('Gabumon','2018-11-15',8,TRUE,2),
 ('Pikachu','2021-1-7',15.04,FALSE,1),
 ('Devimon','2017-5-12',11,TRUE,5);

 insert into animals(name,date_of_birth,escape_attempts,neutered,weight_kg) values
 ('Charmander','2020-2-8',0,FALSE,-11),
 ('Plantmon','2021-11-15',2,TRUE,-5.7),
 ('Squirtle','1993-4-2',3,FALSE,-12.13),
 ('Angemon','2005-6-12',1,TRUE,-45),
 ('Boarmon','2005-6-7',7,TRUE,20.4),
 ('Blossom','1998-10-13',3,TRUE,17),
 ('Ditto','2022-5-14',4,TRUE,22);

  insert into owners(full_name,age) values
  ('Sam Smith', 34),
  ('Jennifer Orwell', 19),
  ('Bob', 45),
  ('Melody Pond ',77),
  ('Dean Winchester', 14),
  ('Jodie Whittaker', 38);

   insert into species (name) values
   ('Pokemon'),
   ('Digimon');

    update animals set species_id= species.id
    from species where animals.name  like '%mon%' and species.name != 'Pokemon';
    update animals set species_id= species.id
    from species where animals.name not like '%mon%' and species.name != 'Digimon';
    
    update animals set owner_id = owners.id from owners
    where animals.name = 'Agumon' and owners.full_name = 'Sam Smith';

    update animals set owner_id = owners.id from owners
    where animals.name in ('Gabumon','Pikachu') and owners.full_name = 'Jennifer Orwell';

    update animals set owner_id = owners.id from owners
    where animals.name in ('Devimon','Plantmon') and owners.full_name = 'Bob';

    update animals set owner_id = owners.id from owners
    where animals.name in ('Charmander','Squirtle','Blossom') and owners.full_name = 'Melody Pond';
   
    update animals set owner_id = owners.id from owners
    where animals.name in ('Angemon','Boarmon') and owners.full_name = 'Dean Winchester';

    
vet_clinic=# insert into vets(name,age,date_of_graduation) values
 ('William Tatcher', 45, '2000-04-23'),
 ('Maisy Smith', 26 , '2019-01-17'),
 ('Stephanie Mendez', 64, '1981-05-04'),
 ('Jack Harkness', 38 , '2008-06-08');

 insert into specializations (vet_name, species_name) values
 ('William Tatcher','Pokemon'),
 ('Stephanie Mendez ','Pokemon'),
 ('Stephanie Mendez', 'Digimon'),
 ('Jack Harkness', 'Digimon');

  insert into specializations (vet_id, species_id) values
 (1,1),
 (3,1),
 (3,2),
 (4,2);

 insert into visits(vets_name,animal_name,date) values
 ('William Tatcher','Agumon','2020-05-24'),
 ('Stephanie Mendez','Agumon','2020-07-22'),
 (' Jack Harkness','Gabumon','2021-02-02'),
 ('Maisy Smith','Pikachu','2020-01-05'),
 ('Maisy Smith','Pikachu','2020-03-08'),
  ('Maisy Smith','Pikachu','2020-05-14'),
('Stephanie Mendez','Devimon','2021-05-04'),
 ('Jack Harkness','Charmander','2021-02-24'),
('Maisy Smith','Plantmon','2019-12-21'),
 ('William Tatcher','Plantmon','2020-08-10'),
 ('Maisy Smith','Plantmon','2021-04-07'),
 ('Stephanie Mendez','Squirtle','2019-09-29'),
 ('Jack Harkness','Angemon','2020-10-03'),
  ('Jack Harkness','Angemon','2020-11-04'),
 ('Maisy Smith','Boarmon','2019-01-24'),
  ('Maisy Smith','Boarmon','2019-05-15'),
 ('Maisy Smith','Boarmon','2020-02-27'),
  ('Maisy Smith','Boarmon','2020-08-03'),
 ('Stephanie Mendez','Blossom','2020-05-24'),
 ('William Tatcher','Blossom','2021-01-11');


  insert into visits(vet_id, animal_id,date) values
  (1,1,'2020-05-24'),
  (3,1,'2020-07-22'),
  (4,2 ,'2021-02-02'),
  (2,3,'2020-01-05'),
  (2,3,'2020-03-08'),
  (2,3,'2020-05-14'),
  (3,4,'2021-05-04'),
  (4,5,'2021-02-24'),
  (2,6,'2019-12-21'),
  (1,6,'2020-08-10'),
  (2,6,'2021-04-07'),
  (3,4,'2019-09-29'),
  (4,8,'2020-10-03'),
  (4,8,'2020-11-04'),
  (2,9,'2019-01-24'),
  (2,9,'2019-05-15'),
  (2,9,'2020-02-27'),
  (2,9,'2020-08-03'),
  (3,10,'2020-05-24'),
  (1,10,'2021-01-11');
 alter table visits
 drop column animal_name;

  alter table visits
  drop column vets_id;
alter table visits rename date to visit_date;
