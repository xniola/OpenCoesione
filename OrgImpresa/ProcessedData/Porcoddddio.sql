--  INIZIO QUERY DA FARE PER LAVORARE CON LA TABELLA ATECO IMPORTATA 

-- Disattivare safe update mode
SET SQL_SAFE_UPDATES = 0;

SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

-- VADO A TOGLIERE L'OVERHEAD DEI CODICI ATECO SULLA TABELLA DEI SOGGETTI
UPDATE soggetti_3
SET COD_ATECO_SOGG = REPLACE(COD_ATECO_SOGG, '_2007', '');
update soggetti_3
SET COD_ATECO_SOGG = REPLACE(COD_ATECO_SOGG, '_2', '');

-- A questo punto aggiungo i codici ateco mancanti
INSERT INTO ateco (COD_ATECO, Descrizione) VALUES ('82.20', 'Attività dei call center');
INSERT INTO ateco (COD_ATECO, Descrizione) VALUES ('72.19.00','Altre attività di ricerca e sviluppo sperimentale nel campo delle scienze naturali e dell ingegneria');
INSERT INTO ateco (COD_ATECO, Descrizione) VALUES ('53.10','Attività postali con obbligo di servizio universale');
INSERT INTO ateco (COD_ATECO, Descrizione) VALUES ('26.20','Fabbricazione di computer e unità periferiche');
INSERT INTO ateco (COD_ATECO, Descrizione) VALUES ('63.11.10','Elaborazione dati');
INSERT INTO ateco (COD_ATECO, Descrizione) VALUES ('08.12',' sabbia; estrazione di argille e caolino');

-- FINE DELLE ROBBE DA FARE PER LA TABELLA IMPORTATA--


-- DA FARE SULLE 3 TABELLE DEI SETTORI (CLOUD, CYBERSEC, BIGDATA)
-- CAMBIARE L'ANNO SULLA CLAUSOLA WHERE
-- BISOGNA FARE PRATICAMENTE 7 QUERY (2014,2015,2016,2017,2018,2019,2020)
select ateco.COD_ATECO as ateco,
    max(ateco.Descrizione) as descrizione,
    count(ateco.COD_ATECO) as cardinalita
from soggetti_3 inner join ateco 
on soggetti_3.COD_ATECO_SOGG=ateco.COD_ATECO
inner join progetti_3 on progetti_3.COD_LOCALE_PROGETTO = soggetti_3.COD_LOCALE_PROGETTO
where substring(progetti_3.OC_DATA_INIZIO_PROGETTO,1,4) = 2014
group by (ateco)
order by(cardinalita) desc;