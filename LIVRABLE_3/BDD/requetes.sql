SELECT SUM(prix) FROM Commande;
--
--
SELECT Titre, COUNT(STATUS) FROM Ouvrage O, Stock S WHERE S.Id_Ouvrage = O.id AND Status = ’Libre’ GROUP BY Titre;
--
--
SELECT MAX (prix) FROM Commande;
--
--
SELECT AVG (prix) FROM Commande;
--
--
SELECT Titre, SUM (Status) FROM Ouvrage O, Stock S WHERE S.Id_Ouvrage = O.id AND Status = ‘Réservé’ GROUP BY Titre;
--
--
SELECT MIN(ISBN) FROM Ouvrage;
--
--
SELECT MAX(id) FROM client;




