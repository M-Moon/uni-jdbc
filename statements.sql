/
SQLiteJDBC
native
/
/
SQLite
3.7.2
/


DROP TABLE planets;
CREATE TABLE "planets" (
"planet_id" INTEGER,
"name" VARCHAR(15),
"popvalue" INTEGER,
PRIMARY KEY("planet_id")
);

DROP TABLE heroes;
CREATE TABLE "heroes" (
"hero_id" INTEGER,
"codename" VARCHAR(30),
"secretIdentity" VARCHAR(30),
"homeWorld_id" INTEGER,
PRIMARY KEY("hero_id"),
FOREIGN KEY ("homeWorld_id") REFERENCES "planets"("homeWorld_id")
);

DROP TABLE powers;
CREATE TABLE "powers" (
"hero_id" INTEGER,
"description" VARCHAR (100),
PRIMARY KEY("hero_id","description"),
FOREIGN KEY ("hero_id") REFERENCES "heroes"("hero_id")
);

DROP TABLE missions;
CREATE TABLE "missions" (
"name" VARCHAR (100),
"planet_name" VARCHAR (15),
PRIMARY KEY("name"),
FOREIGN KEY ("planet_name") REFERENCES "planets"("planet_name")
);

INSERT INTO "planets" ("planet_id","name","popvalue") VALUES(1,'Antares',17);
INSERT INTO "planets" ("planet_id","name","popvalue") VALUES(2,'Bgztl',8);
INSERT INTO "planets" ("planet_id","name","popvalue") VALUES(3,'Bismoll',27);
INSERT INTO "planets" ("planet_id","name","popvalue") VALUES(4,'Braal',8);
INSERT INTO "planets" ("planet_id","name","popvalue") VALUES(5,'Cargg',20);
INSERT INTO "planets" ("planet_id","name","popvalue") VALUES(6,'Colu',30);
INSERT INTO "planets" ("planet_id","name","popvalue") VALUES(7,'Daxam',30);
INSERT INTO "planets" ("planet_id","name","popvalue") VALUES(8,'Dryad','\N');
INSERT INTO "planets" ("planet_id","name","popvalue") VALUES(9,'Durla',10);
INSERT INTO "planets" ("planet_id","name","popvalue") VALUES(10,'Earth','\N');
INSERT INTO "planets" ("planet_id","name","popvalue") VALUES(11,'Hyrakius','\N');
INSERT INTO "planets" ("planet_id","name","popvalue") VALUES(12,'Imsk',27);
INSERT INTO "planets" ("planet_id","name","popvalue") VALUES(13,'Krypton',0);
INSERT INTO "planets" ("planet_id","name","popvalue") VALUES(14,'Naltor',27);
INSERT INTO "planets" ("planet_id","name","popvalue") VALUES(15,'Orando',8);
INSERT INTO "planets" ("planet_id","name","popvalue") VALUES(16,'Phlon','\N');
INSERT INTO "planets" ("planet_id","name","popvalue") VALUES(17,'Rimbor',30);
INSERT INTO "planets" ("planet_id","name","popvalue") VALUES(18,'Starhaven',27);
INSERT INTO "planets" ("planet_id","name","popvalue") VALUES(19,'Talok VIII',27);
INSERT INTO "planets" ("planet_id","name","popvalue") VALUES(20,'Teall','\N');
INSERT INTO "planets" ("planet_id","name","popvalue") VALUES(21,'Tharr',27);
INSERT INTO "planets" ("planet_id","name","popvalue") VALUES(22,'Titan','\N');
INSERT INTO "planets" ("planet_id","name","popvalue") VALUES(23,'Trom',27);
INSERT INTO "planets" ("planet_id","name","popvalue") VALUES(24,'Winath',8);
INSERT INTO "planets" ("planet_id","name","popvalue") VALUES(25,'Xanthu','\N');
INSERT INTO "planets" ("planet_id","name","popvalue") VALUES(26,'Zoon',34);

INSERT INTO "heroes" ("hero_id","codename","secretIdentity","homeWorld_id") VALUES(1,'Cosmic Boy','Rokk Krinn',4);
INSERT INTO "heroes" ("hero_id","codename","secretIdentity","homeWorld_id") VALUES(2,'Lightning Lad','Garth Ranzz',24);
INSERT INTO "heroes" ("hero_id","codename","secretIdentity","homeWorld_id") VALUES(3,'Saturn Girl','Imra Ardeen',22);
INSERT INTO "heroes" ("hero_id","codename","secretIdentity","homeWorld_id") VALUES(4,'Triplicate Girl','Luornu Durgo',5);
INSERT INTO "heroes" ("hero_id","codename","secretIdentity","homeWorld_id") VALUES(5,'Phantom Girl','Tinya Wazzo',2);
INSERT INTO "heroes" ("hero_id","codename","secretIdentity","homeWorld_id") VALUES(6,'Superboy','Kal-El (a.k.a. Clark Kent)',13);
INSERT INTO "heroes" ("hero_id","codename","secretIdentity","homeWorld_id") VALUES(7,'Chameleon Boy','Reep Daggle',9);
INSERT INTO "heroes" ("hero_id","codename","secretIdentity","homeWorld_id") VALUES(8,'Colossal Boy','Gim Allon',10);
INSERT INTO "heroes" ("hero_id","codename","secretIdentity","homeWorld_id") VALUES(9,'Invisible Kid','Lyle Norg',10);
INSERT INTO "heroes" ("hero_id","codename","secretIdentity","homeWorld_id") VALUES(10,'Star Boy','Thom Kallor',25);
INSERT INTO "heroes" ("hero_id","codename","secretIdentity","homeWorld_id") VALUES(11,'Kid Quantum','James Cullen',1);
INSERT INTO "heroes" ("hero_id","codename","secretIdentity","homeWorld_id") VALUES(12,'Brainiac 5','Querl Dox',6);
INSERT INTO "heroes" ("hero_id","codename","secretIdentity","homeWorld_id") VALUES(13,'Supergirl','Kara Zor-El',13);
INSERT INTO "heroes" ("hero_id","codename","secretIdentity","homeWorld_id") VALUES(14,'Laurel Gand','',7);
INSERT INTO "heroes" ("hero_id","codename","secretIdentity","homeWorld_id") VALUES(15,'Sun Boy','Dirk Morgna',10);
INSERT INTO "heroes" ("hero_id","codename","secretIdentity","homeWorld_id") VALUES(16,'Shrinking Violet','Salu Digby',12);
INSERT INTO "heroes" ("hero_id","codename","secretIdentity","homeWorld_id") VALUES(17,'Bouncing Boy','Chuck Taine',10);
INSERT INTO "heroes" ("hero_id","codename","secretIdentity","homeWorld_id") VALUES(18,'Ultra Boy','Jo Nah',17);
INSERT INTO "heroes" ("hero_id","codename","secretIdentity","homeWorld_id") VALUES(19,'Mon-El','Lar Gand',7);
INSERT INTO "heroes" ("hero_id","codename","secretIdentity","homeWorld_id") VALUES(20,'Matter-Eater Lad','Tenzil Kem',3);
INSERT INTO "heroes" ("hero_id","codename","secretIdentity","homeWorld_id") VALUES(21,'Element Lad','Jan Arrah',21);
INSERT INTO "heroes" ("hero_id","codename","secretIdentity","homeWorld_id") VALUES(22,'Lightning Lass','Ayla Ranzz',24);
INSERT INTO "heroes" ("hero_id","codename","secretIdentity","homeWorld_id") VALUES(23,'Dream Girl','Nura Nal',14);
INSERT INTO "heroes" ("hero_id","codename","secretIdentity","homeWorld_id") VALUES(24,'Ferro Lad','Andrew Nolan',10);
INSERT INTO "heroes" ("hero_id","codename","secretIdentity","homeWorld_id") VALUES(25,'Karate Kid','Val Armorr',10);
INSERT INTO "heroes" ("hero_id","codename","secretIdentity","homeWorld_id") VALUES(26,'Princess Projectra','Projectra Wind''zzor',15);
INSERT INTO "heroes" ("hero_id","codename","secretIdentity","homeWorld_id") VALUES(27,'Shadow Lass','Tasmia Mallor',19);
INSERT INTO "heroes" ("hero_id","codename","secretIdentity","homeWorld_id") VALUES(28,'Chemical King','Condo Arlik',16);
INSERT INTO "heroes" ("hero_id","codename","secretIdentity","homeWorld_id") VALUES(29,'Timber Wolf','Brin Londo',26);
INSERT INTO "heroes" ("hero_id","codename","secretIdentity","homeWorld_id") VALUES(30,'Wildfire','Drake Burroughs',10);
INSERT INTO "heroes" ("hero_id","codename","secretIdentity","homeWorld_id") VALUES(31,'Tyroc','Troy Stewart',10);
INSERT INTO "heroes" ("hero_id","codename","secretIdentity","homeWorld_id") VALUES(32,'Dawnstar','',18);
INSERT INTO "heroes" ("hero_id","codename","secretIdentity","homeWorld_id") VALUES(33,'Blok','',8);
INSERT INTO "heroes" ("hero_id","codename","secretIdentity","homeWorld_id") VALUES(34,'Invisible Kid II','Jacques Foccart',10);
INSERT INTO "heroes" ("hero_id","codename","secretIdentity","homeWorld_id") VALUES(35,'White Witch','Mysa Nal',14);
INSERT INTO "heroes" ("hero_id","codename","secretIdentity","homeWorld_id") VALUES(36,'Magnetic Kid','Pol Krinn',4);
INSERT INTO "heroes" ("hero_id","codename","secretIdentity","homeWorld_id") VALUES(37,'Polar Boy','Brek Bannin',21);
INSERT INTO "heroes" ("hero_id","codename","secretIdentity","homeWorld_id") VALUES(38,'Quislet','(an unpronounceable glyph)',20);
INSERT INTO "heroes" ("hero_id","codename","secretIdentity","homeWorld_id") VALUES(39,'Tellus','Ganglios',11);
INSERT INTO "heroes" ("hero_id","codename","secretIdentity","homeWorld_id") VALUES(40,'Hero on non-existant planet','Nobody',473);

INSERT INTO "powers" ("hero_id","description") VALUES(1,'Magnetism manipulation');
INSERT INTO "powers" ("hero_id","description") VALUES(1,'control and generation of magnetic fields');
INSERT INTO "powers" ("hero_id","description") VALUES(2,'Electrical manipulation');
INSERT INTO "powers" ("hero_id","description") VALUES(2,'control and generation of electrical fields');
INSERT INTO "powers" ("hero_id","description") VALUES(3,'Telepathy');
INSERT INTO "powers" ("hero_id","description") VALUES(3,'ability to read and control minds');
INSERT INTO "powers" ("hero_id","description") VALUES(4,'Ability to split into three bodies');
INSERT INTO "powers" ("hero_id","description") VALUES(5,'Intangibility');
INSERT INTO "powers" ("hero_id","description") VALUES(6,'Flight');
INSERT INTO "powers" ("hero_id","description") VALUES(6,'Invulnerability');
INSERT INTO "powers" ("hero_id","description") VALUES(6,'Superhuman Strength');
INSERT INTO "powers" ("hero_id","description") VALUES(6,'Superhuman Speed');
INSERT INTO "powers" ("hero_id","description") VALUES(6,'Super vision, consisting of');
INSERT INTO "powers" ("hero_id","description") VALUES(6,'X-Ray Vision');
INSERT INTO "powers" ("hero_id","description") VALUES(6,'Telescopic/Microscopic Vision');
INSERT INTO "powers" ("hero_id","description") VALUES(6,'Heat Vision');
INSERT INTO "powers" ("hero_id","description") VALUES(6,'Super-hearing');
INSERT INTO "powers" ("hero_id","description") VALUES(6,'Super Breath (including Freeze Breath)');
INSERT INTO "powers" ("hero_id","description") VALUES(6,'Eidetic memory');
INSERT INTO "powers" ("hero_id","description") VALUES(6,'Regeneration');
INSERT INTO "powers" ("hero_id","description") VALUES(6,'Longevity');
INSERT INTO "powers" ("hero_id","description") VALUES(6,'Other enhanced physical senses (including olfaction)');
INSERT INTO "powers" ("hero_id","description") VALUES(7,'Shapeshifting');
INSERT INTO "powers" ("hero_id","description") VALUES(8,'Ability to grow to gigantic size');
INSERT INTO "powers" ("hero_id","description") VALUES(9,'Invisibility to the naked eye');
INSERT INTO "powers" ("hero_id","description") VALUES(10,'Ability to increase the mass of objects');
INSERT INTO "powers" ("hero_id","description") VALUES(11,'Ability to cast stasis fields');
INSERT INTO "powers" ("hero_id","description") VALUES(12,'12th level intelligence');
INSERT INTO "powers" ("hero_id","description") VALUES(13,'Flight');
INSERT INTO "powers" ("hero_id","description") VALUES(13,'Invulnerability');
INSERT INTO "powers" ("hero_id","description") VALUES(13,'Superhuman Strength');
INSERT INTO "powers" ("hero_id","description") VALUES(13,'Superhuman Speed');
INSERT INTO "powers" ("hero_id","description") VALUES(13,'Super vision, consisting of');
INSERT INTO "powers" ("hero_id","description") VALUES(13,'X-Ray Vision');
INSERT INTO "powers" ("hero_id","description") VALUES(13,'Telescopic/Microscopic Vision');
INSERT INTO "powers" ("hero_id","description") VALUES(13,'Heat Vision');
INSERT INTO "powers" ("hero_id","description") VALUES(13,'Super-hearing');
INSERT INTO "powers" ("hero_id","description") VALUES(13,'Super Breath (including Freeze Breath)');
INSERT INTO "powers" ("hero_id","description") VALUES(13,'Eidetic memory');
INSERT INTO "powers" ("hero_id","description") VALUES(13,'Regeneration');
INSERT INTO "powers" ("hero_id","description") VALUES(13,'Longevity');
INSERT INTO "powers" ("hero_id","description") VALUES(13,'Other enhanced physical senses (including olfaction)');
INSERT INTO "powers" ("hero_id","description") VALUES(14,'Flight');
INSERT INTO "powers" ("hero_id","description") VALUES(14,'Invulnerability');
INSERT INTO "powers" ("hero_id","description") VALUES(14,'Superhuman Strength');
INSERT INTO "powers" ("hero_id","description") VALUES(14,'Superhuman Speed');
INSERT INTO "powers" ("hero_id","description") VALUES(14,'Super vision, consisting of');
INSERT INTO "powers" ("hero_id","description") VALUES(14,'X-Ray Vision');
INSERT INTO "powers" ("hero_id","description") VALUES(14,'Telescopic/Microscopic Vision');
INSERT INTO "powers" ("hero_id","description") VALUES(14,'Heat Vision');
INSERT INTO "powers" ("hero_id","description") VALUES(14,'Super-hearing');
INSERT INTO "powers" ("hero_id","description") VALUES(14,'Super Breath (including Freeze Breath)');
INSERT INTO "powers" ("hero_id","description") VALUES(14,'Eidetic memory');
INSERT INTO "powers" ("hero_id","description") VALUES(14,'Regeneration');
INSERT INTO "powers" ("hero_id","description") VALUES(14,'Longevity');
INSERT INTO "powers" ("hero_id","description") VALUES(14,'Other enhanced physical senses (including olfaction)');
INSERT INTO "powers" ("hero_id","description") VALUES(15,'light generation');
INSERT INTO "powers" ("hero_id","description") VALUES(15,'Heat generation');
INSERT INTO "powers" ("hero_id","description") VALUES(16,'Ability to shrink to microscopic size');
INSERT INTO "powers" ("hero_id","description") VALUES(17,'Super-bouncing');
INSERT INTO "powers" ("hero_id","description") VALUES(18,'Super-strength');
INSERT INTO "powers" ("hero_id","description") VALUES(18,'super-speed');
INSERT INTO "powers" ("hero_id","description") VALUES(18,'flight');
INSERT INTO "powers" ("hero_id","description") VALUES(18,'invulnerability');
INSERT INTO "powers" ("hero_id","description") VALUES(18,'flash vision');
INSERT INTO "powers" ("hero_id","description") VALUES(18,'penetra-vision');
INSERT INTO "powers" ("hero_id","description") VALUES(19,'Flight');
INSERT INTO "powers" ("hero_id","description") VALUES(19,'Invulnerability');
INSERT INTO "powers" ("hero_id","description") VALUES(19,'Superhuman Strength');
INSERT INTO "powers" ("hero_id","description") VALUES(19,'Superhuman Speed');
INSERT INTO "powers" ("hero_id","description") VALUES(19,'Super vision, consisting of');
INSERT INTO "powers" ("hero_id","description") VALUES(19,'X-Ray Vision');
INSERT INTO "powers" ("hero_id","description") VALUES(19,'Telescopic/Microscopic Vision');
INSERT INTO "powers" ("hero_id","description") VALUES(19,'Heat Vision');
INSERT INTO "powers" ("hero_id","description") VALUES(19,'Super-hearing');
INSERT INTO "powers" ("hero_id","description") VALUES(19,'Super Breath (including Freeze Breath)');
INSERT INTO "powers" ("hero_id","description") VALUES(19,'Eidetic memory');
INSERT INTO "powers" ("hero_id","description") VALUES(19,'Regeneration');
INSERT INTO "powers" ("hero_id","description") VALUES(19,'Longevity');
INSERT INTO "powers" ("hero_id","description") VALUES(19,'Other enhanced physical senses (including olfaction)');
INSERT INTO "powers" ("hero_id","description") VALUES(20,'Can eat any substance');
INSERT INTO "powers" ("hero_id","description") VALUES(21,'Elemental transmutation');
INSERT INTO "powers" ("hero_id","description") VALUES(22,'Electrical manipulation');
INSERT INTO "powers" ("hero_id","description") VALUES(22,'control and generation of electrical fields');
INSERT INTO "powers" ("hero_id","description") VALUES(23,'Precognition');
INSERT INTO "powers" ("hero_id","description") VALUES(24,'Ability to transform into iron');
INSERT INTO "powers" ("hero_id","description") VALUES(24,'superhuman strength');
INSERT INTO "powers" ("hero_id","description") VALUES(24,'invulnerability');
INSERT INTO "powers" ("hero_id","description") VALUES(25,'Mastery of all known martial arts');
INSERT INTO "powers" ("hero_id","description") VALUES(26,'Generation of illusions');
INSERT INTO "powers" ("hero_id","description") VALUES(27,'Shadow-casting');
INSERT INTO "powers" ("hero_id","description") VALUES(28,'Control over the rate of chemical reactions');
INSERT INTO "powers" ("hero_id","description") VALUES(29,'Superhuman agility');
INSERT INTO "powers" ("hero_id","description") VALUES(29,'Superhuman strength');
INSERT INTO "powers" ("hero_id","description") VALUES(30,'Energy blasts');
INSERT INTO "powers" ("hero_id","description") VALUES(30,'Energy manipulation');
INSERT INTO "powers" ("hero_id","description") VALUES(30,'flight.');
INSERT INTO "powers" ("hero_id","description") VALUES(31,'Sonic power that creates unusual effects');
INSERT INTO "powers" ("hero_id","description") VALUES(32,'Interstellar tracking');
INSERT INTO "powers" ("hero_id","description") VALUES(32,'unaided space travel');
INSERT INTO "powers" ("hero_id","description") VALUES(32,'flight');
INSERT INTO "powers" ("hero_id","description") VALUES(33,'Superhuman strength');
INSERT INTO "powers" ("hero_id","description") VALUES(33,'Superhuman physical resistance');
INSERT INTO "powers" ("hero_id","description") VALUES(500,'deliberately wrong');
INSERT INTO "powers" ("hero_id","description") VALUES(33,'energy absorption');
INSERT INTO "powers" ("hero_id","description") VALUES(34,'Invisibility to the naked eye and to most forms of detection');
INSERT INTO "powers" ("hero_id","description") VALUES(35,'Spellcasting');
INSERT INTO "powers" ("hero_id","description") VALUES(36,'Magnetism manipulation');
INSERT INTO "powers" ("hero_id","description") VALUES(36,'ability to generate and control magnetic fields');
INSERT INTO "powers" ("hero_id","description") VALUES(37,'Cold manipulation');
INSERT INTO "powers" ("hero_id","description") VALUES(37,'ability to absorb heat and produce cold');
INSERT INTO "powers" ("hero_id","description") VALUES(39,'Telepathy');
INSERT INTO "powers" ("hero_id","description") VALUES(39,'telekinesis');

INSERT INTO "missions" ("name","planet_name") VALUES('Darkseid','Apocalypse');
INSERT INTO "missions" ("name","planet_name") VALUES('Earth War','Earth');
INSERT INTO "missions" ("name","planet_name") VALUES('Planet Kidnap','Daxam');
INSERT INTO "missions" ("name","planet_name") VALUES('Mission on non-existant planet','Zorgorn');

CREATE INDEX planets_id_index ON planets(planet_id);
CREATE INDEX heroes_code_name_index ON heroes(codename);

