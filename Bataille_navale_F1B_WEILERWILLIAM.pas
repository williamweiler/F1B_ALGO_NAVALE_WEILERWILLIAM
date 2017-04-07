{CONST
//commentaire constante
NBBATEAU=5:integer//nbr bateaux maximum
MAXCASE=5:ENTIER
MINL=1:ENTIER//nbr ligne minimum
MAXL=50:ENTIER//nbr ligne maximum
MINC=1:ENTIER//nbr collones minimum
MAXC=50:ENTIER//nbr collones maximum

TYPE: ENREGISTREMENT

TYPE: CASE ENREGISTREMENT
    LIGNE:ENTIER
    COL:ENTIER
FINENREGISTREMENT

Type bateau:enregistrement
nCase:Tableau[1..MAXCASE] de Case
FINENREGISTREMENT

type flotte = ENREGISTREMENT
    nBateau:Tableau [1..nbBateau] de Bateau 
FINENREGISTREMENT

type positionBateau=(en ligne,en colone, en diag) 

type etatBateau=(toucher,couler)

type etatFLotte=(aflot,asombrer)

type etatJoueur=(gagne,perdu)

____________________________________________________________________________________________________________________________________________________________________________
//fonction et procedures

procedure createCase(l,c:ENTIER; VAR mCase:case)

DEBUT 
    mcase.ligne:=1
    mCase.col:=c
FIN
____________________________________________________________________________________________________________________________________________________________________________

fonction cmpcase (mcase,tcase:case):booleen 
DEBUT
    si ((mCase.col=tCase.col) et (mCase.ligne=tCase.ligne)) alors
    cmpcase:=VRAI
sinon
    cmplCase:=FAUX
FINSI
FIN

____________________________________________________________________________________________________________________________________________________________________________
fonction createBateau(ncase:case;talle:entier):bateau

VAR
    res:bateau
    positionBateau:positionBateau
    i,pos:ENTIER
DEBUT
    pos:=aleatoire[1..3]
    positionBateau:=positionBateau(pos)
pour i de 1 a MAXCASE pas 1 FAIRE
    si (i<taille) alors
        DEBUT
            res.nCase[i].ligne:=mCase.ligne
            res.nCase[i].col:=mCase.col
        sinon

            DEBUT
                res.nCase[i].ligne:=0
                res.nCase[i].col:=0
            FIN
        FINSI
            SI(positionBateau=enligne)ALORS
            mCase.col:=mCase.col+1
                SINON SI (positionBateau=encolonne) ALors
                 m.Case.ligne:=m.Case.ligne+1
                 sinon si (posBateau= endiag) Alors
                 DEBUT
                    mCase.ligne=mCAse.ligne+1
                    mCase.col=mCase.col+1
                 FIN
            FINSI
        FINPOUR
    createBateau:=res
FIN

____________________________________________________________________________________________________________________________________________________________________________
fonction ctrlCase (mBat:Bateau;mCase:case):booleen

VAr
    i:ENTIER
    valtest:boolean

DEBUT
    valtest:=FAUX
        Pour i de 1 a MAXCASE pas 1 Faire
        DEBUT
            si (cmpCase(mBat.nCase[i],mCASE))ALORs
                valtest:=Vrai
            FINSI
        FINPOUR
    clrtcase:=valtest
FIN
____________________________________________________________________________________________________________________________________________________________________________
fonction ctrlFlotte(mflotte:Flotte;mCase:case)

VAR
    i:ENTIER
    valtest:booleen

DEBUT
    valtest:=FAUx
    pour i de 1 a NBBATEAU pas de 1 FAIRE
        DEBUT
            SI (ctrlCase(mFlotte.nBateau[i],mCase))ALORs
            valtest:=VRAI
            FINSI
    FINPOUR
    crtlflotte:= valtest
FIN


VAR
lig,colonne:ENTIER
nCases:CASES
mBat:Bateau

mCASES:CASES
nBateau1,nBateau2:Bateau
nom1,nom2:chr
i:Entier
nflotte1,nflotte2:flotte



DEBUT
    ECRIRE('entrez le nom du 1er joueur')
    LIRE(nom1)
    ECRIRE ('entrez la colonne de votre bateau')
    LIRE(colonne)
    ECRIRE ('entrez la ligne de votre bateau')
    LIRE(lig)
    
    createCases(lig,colonne,nCases)
    nBateau1<- createBateau(nCases,MaxCase)
    REPETER

        ECRIRE ('entrez le nom du 2eme joueur')
        LIRE (nom2)
        ECRIRE ('entrez la colonne de votre bateau')
        LIRE(colonne)
        ECIRE ('entrez la ligne de votre bateau')
        LIRE(lig)
       createCases(lig,colonne,nCases)
    JUSQU'A CmpCases(nCases,nBateau1.nCases[1]) = FAUX

    nBateau2<- createBateau(nCases,MaxCase)

REPETER
                        ECRIRE ('Joueur : ',nom1)
                        ECRIRE ('entrez la ligne viser')
                        LIRE(lig)
                        ECRIRE ('entrez la colonne viser')
                        LIRE(colonne)
                        createCases(lig,colonne,nCases)
                        POUR i de 1 a  MaxCase FAIRE
                            DEBUT
                                SI ctrlCases(nBateau2,nCases) = VRAI then
                                    DEBUT
                                        ECRIRE ('Toucher')
                                        nBateau2.nCases[i].colonne <- 0
                                        nBateau2.nCases[i].ligne <- 0
                                    FIN
                                SINON
                                    ECRIRE ('Manquer')
                            FIN
                        LIRE
                    nflotte1.nbateau[2] <- nBateau2 
                    SI ctrlFlotte(nflotte1,nCases) = FAUX then
                        DEBUT
                    //Tour du 2eme joueur
                            ECRIRE ('Joueur : ',nom2)
                            ECRIRE ('entrez la ligne viser')
                            LIRE(lig)
                            ECRIRE ('entrez la colonne viser')
                            LIRE(colonne)
                            createCases(lig,colonne,nCases)
                            POUR i de 1 a  MaxCase FAIRE
                                DEBUT
                                    SI ctrlCases(nBateau1,nCases) = VRAI then
                                        DEBUT
                                            ECRIRE ('Toucher')
                                            nBateau1.nCases[i].colonne <- 0
                                            nBateau1.nCases[i].ligne <- 0
                                        FIN
                                    SINON
                                        ECRIRE ('Manquer')
                                FIN
                            LIRE
                        FIN

nflotte2.nbateau[1] <- nBateau1 
//cherche si un joueur a perud
            JUSQU'A ctrlFlotte(nflotte1,ncases) = FAUX OR  ctrlFlotte(nflotte2,ncases) = FAUX


FIN.



}

program naval;

uses crt;



CONST
//commentaire constante
NBBATEAU=5;//nbr bateaux maximum
MAXCASE=5;
MINL=1;//nbr ligne minimum
MAXL=50;//nbr ligne maximum
MINC=1;//nbr colonnelones minimum
MAXC=50;//nbr colonnelones maximum

{TYPE: ENREGISTREMENT}
type Cases=record
    Ligne:integer;
    colonne:integer;
end;

type Bateau=record
    nCases:array[1..MaxCase] Of Cases;
end;

type Flotte=record
    nBateau:array[1..NbBateau] Of Bateau;
end;

type PositionBateau=(Enligne,Encolonne,EnDiagonale);


type EtatBateau=(Toucher,Couler);

type EtatFlotte=(aFlot,aSombrer);

type EtatJoueur=(Gagne,Perd);


procedure createCASES(l,c:integer; VAR mCASES:CASES);

BEGIN
	mCASES.ligne:=1;
	mCASES.colonne:=c;
END;


function cmpCASES (mCASES,tCASES:CASES):boolean;
BEGIN

	IF ((mCASES.colonne=tCASES.colonne) AND (mCASES.ligne=tCASES.ligne)) then
	cmpCASES:=true
ELSE
	cmpCASES:=false
end;

function CreateBateau(nCases:Cases;Taille:integer):Bateau;

VAR
    res:Bateau;
    i,pos:integer;
    posBateau:PositionBateau;
BEGIN
    
    randomize;
    pos:=random(3)+1;
    posBateau:=PositionBateau(pos);
    //pour i de 1 au maximum de cases que peux avoir un bateau
    FOR i:=1 TO MaxCase DO
        begin
            //si i<=Taille du Bateau
            IF i<=Taille THEN
                begin
                    //remplie la case
                    res.nCases[i].Ligne:=nCases.Ligne;
                    res.ncases[i].colonne:=nCases.colonne;
                end
            ELSE
                begin
                    // sinon initialise à 0 
                    res.ncases[i].Ligne:=0;
                    res.ncases[i].colonne:=0;
                end;
          
            IF (posBateau=EnLigne) THEN
                begin
                    //augmente la colonne de 1 pour la  suivante
                    nCases.colonne:=nCases.colonne+1;
                end
            ELSE
                begin
                  
                    IF (posBateau=Encolonne) THEN
                        begin
                           
                            nCases.Ligne:=nCases.Ligne+1;
                        end
                    ELSE
                        begin
                         
                            nCases.colonne:=nCases.colonne+1;
                            nCases.Ligne:=nCases.Ligne+1;
                        end;
                end;
        end;
    
    CreateBateau:=res;
END;

function ctrlCASES (mBat:Bateau;mCASES:CASES):boolean;

VAr
    i:integer;
    valtest:boolean;


BEGIN
    valtest:=false;
           for i := 1 to MAXCASE do
        BEGIN
        if (cmpCASES(mBat.ncases[i],mCASES))then

                valtest:=true;
                END;

    ctrlCASES:=valtest;
END ;

function ctrlFlotte(mflotte:Flotte;mCASES:CASES):boolean;

VAR
	i:integer;
	valtest:boolean;

BEGIN
	valtest:=false;
	for i := 1 to NBBATEAU  do
		BEGIN
			if (ctrlCASES(mFlotte.nBateau[i],mCASES))then
			valtest:=true;
        END;
	ctrlflotte:= valtest;
END;

VAR
lig,colonne:integer;
nCases:CASES;
mBat:Bateau;

mCASES:CASES;
nBateau1,nBateau2:Bateau;
nom1,nom2:string;
i:integer;
nflotte1,nflotte2:flotte;


BEGIN
    writeln('entrez le nom du 1er joueur');
    readln(nom1);
    writeln ('entrez la colonne de votre bateau');
    readln(colonne);
    writeln ('entrez la ligne de votre bateau');
    readln(lig);
    
    createCases(lig,colonne,nCases);
    nBateau1:= createBateau(nCases,MaxCase);
    REPEAT
        writeln('entrez le nom du 2eme joueur');
        readln(nom2);
        writeln ('entrez la colonne de votre bateau');
        readln(colonne); 
        writeln ('entrez la ligne de votre bateau');
        readln(lig);
        
        createCases(lig,colonne,nCases);
    until CmpCases(nCases,nBateau1.nCases[1]) = false ;

    nBateau2:= createBateau(nCases,MaxCase);

REPEAT
                        writeln ('Joueur : ',nom1);
                        writeln ('entrez la ligne viser');
                        readln(lig);
                        writeln ('entrez la colonne viser');
                        readln(colonne);
                        createCases(lig,colonne,nCases);
                        For i:=1 to  MaxCase do
                            begin
                                if ctrlCases(nBateau2,nCases) = true then
                                    begin
                                        writeln ('Toucher');
                                        nBateau2.nCases[i].colonne := 0;
                                        nBateau2.nCases[i].ligne := 0;
                                    end
                                else
                                    writeln ('Manquer');
                            end;
                        readln;
                    nflotte1.nbateau[2] := nBateau2 ;
                    if ctrlFlotte(nflotte1,nCases) = false then
                        begin
                    //Tour du 2eme joueur
                            writeln ('Joueur : ',nom2);
                            writeln ('entrez la ligne viser');
                            readln(lig);
                            writeln ('entrez la colonne viser');
                            readln(colonne);
                            createCases(lig,colonne,nCases);
                            For i:=1 to  MaxCase do
                                begin
                                    if ctrlCases(nBateau1,nCases) = true then
                                        begin
                                            writeln ('Toucher');
                                            nBateau1.nCases[i].colonne := 0;
                                            nBateau1.nCases[i].ligne := 0;
                                        end
                                    else
                                        writeln ('Manquer');
                                end;
                            readln;
                        end;

nflotte2.nbateau[1] := nBateau1 ;
//cherche si un joueur a perdu
            until ctrlFlotte(nflotte1,ncases) = false OR  ctrlFlotte(nflotte2,ncases) = false;


end.
