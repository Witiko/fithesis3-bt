Formát souboru `metadata_zaverecne_prace.csv.gz`:

  Sloupce:
    Fakulta
    Typ studia
    Rok obhájení
    Hodnocení obhajoby
    Pořadí souboru ke studiu
    MIME-type
    Přípona jména souboru
    Neprázdné, pokud `file soubor | grep -q 'TeX DVI file'`
    Neprázdné, pokud je MIME-type `application/postscript` a `grep -q 'TeXDict' soubor`
    Creator, pokud je MIME-type `application/pdf`
    Producer, pokud je MIME-type `application/pdf`

  Na pořadí řádků záleží.
  Zahrnuty jsou jenom soubory označené atributem 'plný text práce'.
  Zahrnut je jen formát, který vložil do archivu uživatel (nikoli automaticky vytvořené).
  Ignorují se malé (do 4000 bajtů) textové soubory (`text/plain`, `text/xml`, `text/html`).

Kódy fakult:
  1411 -- Lékařská fakulta
  1421 -- Filozofická fakulta
  1422 -- Právnická fakulta
  1423 -- Fakulta sociálních studií
  1431 -- Přírodovědecká fakulta
  1433 -- Fakulta informatiky
  1441 -- Pedagogická fakulta
  1451 -- Fakulta sportovních studií
  1456 -- Ekonomicko-správní fakulta

Známky (viz https://is.muni.cz/auth/predmety/prehled_ukonceni_a_hodnoceni):
  A -- Výborně
  P -- Prospěl
  O -- Obhájil
  B -- Velmi dobře
  C -- Dobře	
  D -- Uspokojivě
  E -- Vyhovující
  F -- Nevyhovující
  N -- Neprospěl
  - -- Odstoupil

Typy studia:
  B -- Bakalářské
  M -- Magisterské
  N -- Magisterské navazující
  D -- Doktorské
  R -- Rigorózní
  C -- Celoživotní
