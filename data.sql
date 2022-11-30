--reponse à la question 2 
CREATE TABLE Patient(
    Nom VARCHAR(225),
    Prenom VARCHAR(225),
    Date_Naiss DATE,
    Groupe_Sanguin VARCHAR(100),
    Poids FLOAT,
    Taille FLOAT,
    Sexe VARCHAR(100),

)

CREATE TABLE Maladie(
    Designation VARCHAR(100),
)

CREATE TABLE Consultation(
    Date_Cons DATE,
    Heure_Cons DATE,
    Type_Cons VARCHAR(225),
)
CREATE TABLE Suivi(
    Mat_Pat VARCHAR(100),
    Code_Mal VARCHAR(100),
)


--reponse à la question 3
ALTER TABLE Patient ADD adresse TEXT varchar(225);


--reponse a la question 4
ALTER TABLE Consultation  MODIFY Type_Cons VARCHAR(30);

--reponse à la question 5
    --ajout aux tables les contraintes de clé primaire et étrangère
        --Table Maladie
        ALTER TABLE Maladies
        ADD PRIMARY KEY (Code_Mal);


        --Table Patient
        ALTER TABLE Patient
        ADD PRIMARY KEY (Mat_Pat);


        -- Table Consultation
        ALTER TABLE Consultation
        ADD PRIMARY KEY (N°) NOT NULL AUTO_INCREMENT,
        ADD FOREIGN KEY (Mat_Pat) REFERENCES Patient (Mat_Pat);


        --Contrainte Table Suivi

        ALTER TABLE Suivi
        ADD FOREIGN KEY Mat_Pat REFERENCES Patient (Mat_Pat),
        ADD FOREIGN KEY Code_Mal REFERENCES Maladie (Code_Mal);


-- Le nom et le prenom doivent être non vide
ALTER TABLE Patient ADD nom NOT NULL, prenom NOT NULL;



-- Le sexe doit être dans 'M' ou 'F'

ALTER TABLE Patient MODIFY COLUMN Sexe ENUM('M','F');


-- La consultation doit etre dans ('Normale','Contrôle'ou bien'Domicile')
ALTER TABLE Consultation MODIFY COLUMN type_consul ENUM('Normale','Contrôle','Domicile');



--reponse à la question 6
-- réponse à la question 6-a
INSERT INTO Patient VALUES  ('120001','ABDI','Sami','01/07/1960','A+',60,1.6,'M'),
                            ('120002','BEN KHALED','aHLEM','24/04/1980','B+',50,1.55,'F'),
                            ('120003','BEN SLIMANE','Abdelkerim','16/05/1980','O-',68,1.7,'M'),
                            ('120004','GHARBI','Isam','03/06/1975','O+',88,1.75,'M'),
                            ('120005','MELKI','Raoudla','15/12/1968','A+',54,1.45,'F'),
                            ('120006','SELMI','Ali','13/11/1952','A-',60,1.55,'M');


-- réponse à la question 6-b
INSERT INTO Maladies VALUES ('150001','Fièvre'),
                            ('150002','GRIPPE'),
                            ('150003','Asthme'),
                            ('150001','Diabète');


--réponse à la question 6-c
INSERT INTO Consultation VALUES ('120003','12/04/2004','08:30','Normale'),
                                ('120003','12/05/2004','15:00','Contrôle'),
                                ('120002','12/04/2004','20:20','Domicile'),
                                ('120001','20/04/2004','15:30','Normale');


--réponse à la question 6-d
INSERT INTO Suivi VALUES('120003','150002'),
                        ('120002','150003'),
                        ('120005','150003'),
                        ('120001','150004');

-- réponse à la question 7
    -- réponse à la question 7-a
    SELECT nom FROM Patient

    --réponse à la question 7-b
    SELECT*  FROM Patient WHERE Groupe_Sanguin='A+';

    -- réponse à la question 7-c
   SELECT* FROM Patient WHERE Sexe='F' and (Groupe_Sanguin='O+' or Groupe_Sanguin='O-') and Poids=70;

    -- réponse à la question 7-d
    SELECT * FROM Patient WHERE Taille > 1.6 and Poids > 62;

    -- réponse à la question 7-e
    select * FROM Patient WHERE date_Naiss BETWEEN 1975 and 1985;

    -- réponse à la question 7-f
    select * FROM Patient WHERE nom LIKE '%S%';


    --  réponse à la question 7-g
    select * FROM Patient WHERE nom LIKE '_E%';

    -- réponse à la question 7-h
    SELECT * FROM Patient WHERE nom NOT LIKE 'S%' and 'A%';


    -- réponse à la question 7-i
   SELECT * FROM 'Patient' ORDER BY Poids ;


    -- réponse à la question 7-j
    select * FROM 'Patient' WHERE Poids = 100*Taille;

    -- réponse à la question 7-k
    select * FROM 'Consultation' WHERE type_consul= 'Normale' and Heure_consul >12:00;
 




