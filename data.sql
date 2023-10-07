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


