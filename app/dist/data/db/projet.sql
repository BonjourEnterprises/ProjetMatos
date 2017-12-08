#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: intervention
#------------------------------------------------------------

CREATE TABLE intervention(
        id_intervention   int (11) Auto_increment  NOT NULL ,
        date_planifie     Date ,
        date_realilsation Date ,
        commentaire       Text ,
        serial_number     Int ,
        PRIMARY KEY (id_intervention )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: materiel
#------------------------------------------------------------

CREATE TABLE materiel(
        serial_number   int (11) Auto_increment  NOT NULL ,
        marque          Varchar (25) ,
        MTBF            Int ,
        name            Varchar (25) ,
        description     Text ,
        id_intervention Int ,
        id_bureau       Varchar (25) ,
        PRIMARY KEY (serial_number )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: etage
#------------------------------------------------------------

CREATE TABLE etage(
        id_etage         Varchar (25) NOT NULL ,
        adresse_batiment Varchar (25) ,
        PRIMARY KEY (id_etage )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: bureau
#------------------------------------------------------------

CREATE TABLE bureau(
        id_bureau Varchar (25) NOT NULL ,
        id_etage  Varchar (25) ,
        PRIMARY KEY (id_bureau )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: batiment
#------------------------------------------------------------

CREATE TABLE batiment(
        adresse_batiment Varchar (25) NOT NULL ,
        PRIMARY KEY (adresse_batiment )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Client
#------------------------------------------------------------

CREATE TABLE Client(
        id_client int (11) Auto_increment  NOT NULL ,
        PRIMARY KEY (id_client )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Site
#------------------------------------------------------------

CREATE TABLE Site(
        id_site Int NOT NULL ,
        PRIMARY KEY (id_site )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: relation5
#------------------------------------------------------------

CREATE TABLE relation5(
        id_client     Int NOT NULL ,
        serial_number Int NOT NULL ,
        PRIMARY KEY (id_client ,serial_number )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: relation1
#------------------------------------------------------------

CREATE TABLE relation1(
        adresse_batiment Varchar (25) NOT NULL ,
        id_site          Int NOT NULL ,
        PRIMARY KEY (adresse_batiment ,id_site )
)ENGINE=InnoDB;

ALTER TABLE intervention ADD CONSTRAINT FK_intervention_serial_number FOREIGN KEY (serial_number) REFERENCES materiel(serial_number);
ALTER TABLE materiel ADD CONSTRAINT FK_materiel_id_intervention FOREIGN KEY (id_intervention) REFERENCES intervention(id_intervention);
ALTER TABLE materiel ADD CONSTRAINT FK_materiel_id_bureau FOREIGN KEY (id_bureau) REFERENCES bureau(id_bureau);
ALTER TABLE etage ADD CONSTRAINT FK_etage_adresse_batiment FOREIGN KEY (adresse_batiment) REFERENCES batiment(adresse_batiment);
ALTER TABLE bureau ADD CONSTRAINT FK_bureau_id_etage FOREIGN KEY (id_etage) REFERENCES etage(id_etage);
ALTER TABLE relation5 ADD CONSTRAINT FK_relation5_id_client FOREIGN KEY (id_client) REFERENCES Client(id_client);
ALTER TABLE relation5 ADD CONSTRAINT FK_relation5_serial_number FOREIGN KEY (serial_number) REFERENCES materiel(serial_number);
ALTER TABLE relation1 ADD CONSTRAINT FK_relation1_adresse_batiment FOREIGN KEY (adresse_batiment) REFERENCES batiment(adresse_batiment);
ALTER TABLE relation1 ADD CONSTRAINT FK_relation1_id_site FOREIGN KEY (id_site) REFERENCES Site(id_site);
