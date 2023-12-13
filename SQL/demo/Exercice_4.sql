CREATE DATABASE IF NOT EXISTS bibliotheque CHARACTER SET = "utf8mb4" COLLATE = "utf8mb4_general_ci";
SHOW DATABASES;
USE bibliotheque;

CREATE TABLE IF NOT EXISTS livres(
id  INT NOT NULL AUTO_INCREMENT,
titre VARCHAR (150),
auteur VARCHAR (50),
editeur VARCHAR (50),
date_publication DATE,
isbn_10 VARCHAR (10),
isbn_13 VARCHAR (15),
PRIMARY KEY (id)

);

INSERT INTO  livres (titre,auteur, editeur, date_publication,isbn_10,isbn_13) 
VALUES
 ("Bleu du ciel","Catherine Patard","Hachette","2023-05-12", "0214547568","0154525452589"),
 ("La haut","Franck Thilliez","Hachette","2023-05-12", "0214547568","0154525452785"),
 ("R","Elisa Cleai","Hachette","2023-05-12", "0214547568","0154525452958");

SELECT * FROM livres;
DROP TABLE IF EXISTS livres;


INSERT INTO livres (titre, auteur, editeur, date_publication, isbn_10, isbn_13)
VALUES 
('Poil de Carrottes','Jules Renard','Livre de Poche','1999-08-25','2253160431','978-2253160434'),
('Les Fourberies de Scapin','Molière','Hachette Education','2016-04-13','2013949677','978-2013949675'),
('Les Cahiers de Douai','Arthur Rimbaud','Nathan','2018-05-04','2091891231','978-2091891231'),
('Cyrano de Bergerac','Edmond Rostand','Nathan','2018-05-03','2091887005','978-2091887005'),
('Dom Juan','Molière','Nathan','2018-08-23','2091891185','978-2091891187'),
('Le Cid','Corneille','Nathan','2017-08-24','2091887595','978-2091887593'),
('Les Fausses Confidences','Marivaux','Nathan','2020-08-20','2091512184','978-2091512181'),
('Les Fleurs du Mal','Charles Baudelaire','Nathan','2020-01-02','2091864951','978-2091864952'),
('Le rouge et le noir','Stendhal','Folio CLassique','1967-01-01','2070412393','978-2070412396'),
('Madame Bovary','Gustave Flaubert','Livre de Poche','2019-05-22','2253183466','978-2253183464'),
('La Chartreuse de Parme','Stendhal','Livre de Poche','2020-09-01','2253160687','978-2253160687'),
('La Rabouilleuse','Honoré de Balzac','Editeur indépendant','2020-04-12','XXXXXXXXXX','979-8636546696'),
('Illusions perdues','Honoré de Balzac','Livre de Poche','2006-08-23','2253085707','978-2253085706'),
('L''Education sentimentale','Gustave Flaubert','Livre de Poche','2002-05-16','2253010693','978-2253010692'),
('Mort sur le Nil','Agatha Christie','Livre de Poche','2014-08-20','201005640X','978-2010056406'),
('Le crime de l''Orient-Express','Agatha Christies','Livre de Poche','2014-08-20','2010009274','978-2010009273'),
('Un cadavre dans la bibliothèque','Agatha Christie','Livre de Poche','2015-06-03','2012202403','978-2012202405'),
('Le train bleu','Agatha Christie','Livre de Poche','2014-08-14','2010056450','978-2010056451'),
('Entretiens sur la multitude du monde','Jean-Claude Carrière','Odile Jacob','2002-09-21','2738110770','978-2738110770'),
('Discours de la méthode','René Descartes','Editeur indépendant','2017-02-03','XXXXXXXXXX','979-8649135313'),
('La République','Platon','Livre de Poche','2016-06-22','2081386690','978-2081386693'),
('Les Politiques','Aristote','Flammarion','2015-04-22','2081358778','978-2081358775'),
('Le Banquet','Platon','Flammarion','2015-04-22','2081382644','978-2081382640'),
('Le gai savoir','Platon','Editeur indépendant','2019-07-05','XXXXXXXXXX','979-8658807928'),
('Stop aux réseaux sociaux ! 10 bonnes raisons de s''en méfier et de s en libérer','Jaron Lanier','DE BOECK SUP','2020-03-17','2807329098','978-2807329096'),
('Transformer votre vie: 19 pistes pour améliorer mes relations, me libérer de mes pensées négatives et réaliser mes rêves !','Julie Guerrière Pacifique','Club Positif','2020-01-22','2373181797','978-2373181791'),
('Remédier à l''insatisfaction: Un guide pratique pour faire face aux problèmes de la vie quotidienne','Carlo di Portago','Editeur indépendant','2020-11-22','XXXXXXXXXX','979-8569448883'),
('Lève-toi et Vends !','Nicolas Caron','Editeur indépendant','2017-09-28','1723716723','978-1723716720'),
('Pensée positive et optimisme: Les deux grands principes pour réussir sa vie ','Christian Dubois','Editeur indépendant','2021-01-07','XXXXXXXXXX','979-8591746797'),
('LE GUIDE DE LA PENSÉE POSITIVE: Comment maîtriser le pouvoir de la pensée pour vivre heureux et atteindre ses objectifs','Vincent Crivelli','Editeur indépendant','2021-02-02','XXXXXXXXXX','979-8703516423');


-- 10 livres les plus anciens
SELECT * FROM livres ORDER BY date_publication LIMIT 10;

-- 10 livres plus anciens  (seulement l’affichage des colonnes : date_publication, auteur, titre) classés par date de publication croissante
SELECT date_publication,auteur,titre FROM livres ORDER BY date_publication LIMIT 10;

-- tous les livres de « Agatha Christie » présent dans la base (à ce stade 3 livres)
SELECT * FROM livres WHERE auteur = "agatha christie";

SELECT * FROM livres WHERE auteur = "agatha christies";
-- Corriger erreur agatha Christies
UPDATE
	livres
 SET
	auteur = "agatha christie"
WHERE 
     auteur = "agatha christies";
     
-- Insertion d'un livre
INSERT INTO  livres (titre,auteur, editeur, date_publication,isbn_10,isbn_13) 
VALUES
 ("Bleu du ciel","Catherine Patard","Hachette","2023-05-12", "0214547568","0154525452589");
 
 -- Suppression livre
 DELETE FROM livres WHERE auteur = "Catherine Patard" AND titre="Bleu du ciel";
 
 -- Requête pour savoir nombe de livres écrits par agatha christie 
SELECT auteur, COUNT(auteur) FROM livres GROUP BY auteur HAVING auteur="agatha christie";

 -- Requête pour savoir nombe de livres écrits par agatha christie manière plus simple
SELECT COUNT(*) as "nb livres" FROM livres WHERE auteur = "agatha christie";

   
   