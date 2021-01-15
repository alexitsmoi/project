program bataille_navale;

uses crt;

type
    TBateau = (torpilleur=2 , vstorpilleur, croiseur ,porte_avion);

    Tlettre = (A=1,B,C,D,E,F,G,H,I,J);

    Tchiffre =1..10;

    Tposition = record
    	    x : integer;
        	y : integer;
    end;

    Tcoord = record
        bateau:Tbateau;
        position : Tposition;
    end;

var
	coord : Tcoord;
    posX,posY,o,r,k,l,m,n: integer;
    joueur1 : array [1..10,1..10] of string;
    joueur2 : array [1..10,1..10] of string;
    blank_1 : array [1..10,1..10] of string;//tableau du joueur1 caché pour le joueur 2
    blank_2 : array [1..10,1..10] of string;//tableau du joueur2 caché pour le joueur 1

procedure init_joueur1;
//BUT : initialisé les bateaux du joueur1
//ENTREE : les coordonnées des bateaux 
//SORTIE : le quadriallage entier du joueur
BEGIN	
	while (o > 1)do //boucle pour entrer les coordonnées des bateaux 
	BEGIN
		writeln('veuillez entrer les abscisses du ', TBateau(o));
		readln(coord.position.x);
		writeln('veuillez entrer les ordonnes du ', TBateau(o));
		readln(coord.position.y);
		for r:= 1 to o do //boucle incrémentation des bateaux 
		BEGIN
			joueur1[coord.position.x,coord.position.y]:= 'x ';
			coord.position.y := coord.position.y + 1;
		end;
		o := o - 1;
	// boucle init le tableau finale du joueur 1

		textcolor(13);
			clrscr;	
		writeln('  1 2 3 4 5 6 7 8 9 10');

		for k:= 1 to 10 do //écriture des position finales 
		BEGIN
			textcolor(13);
			write(Tlettre(k),' ');
			for l := 1 to 10 do
				BEGIN
					if (joueur1[k,l] <> 'x ') then
					BEGIN
						joueur1[k,l] := '+ ';
						textcolor(15);
						write(joueur1[k,l]);
					end;
					if (joueur1[k,l] = 'x ') then
					BEGIN
						textcolor(2);
						write(joueur1[k,l]);
					end;
				end;
				writeln;
		end;
	end;
end;

procedure init_joueur2;
//BUT : initialisé les bateaux du joueur 2
//ENTREE : les coordonnées des bateaux 
//SORTIE : le quadriallage entier du joueur	


BEGIN
	while (o > 1)do //boucle pour entrer les coordonnées des bateaux
	BEGIN
		writeln('veuillez entrer les abscisses du ', TBateau(o));
		readln(coord.position.x);
		writeln('veuillez entrer les ordonnes du ', TBateau(o));
		readln(coord.position.y);
		for r:= 1 to o do //boucle incrémentation des bateaux 
		BEGIN
			joueur2[coord.position.x,coord.position.y]:= 'x ';
			coord.position.y := coord.position.y + 1;
		end;
		o := o - 1;
	// boucle init le tableau finale du joueur 2

		textcolor(13);
			clrscr;	
		writeln('  1 2 3 4 5 6 7 8 9 10');

		for k:= 1 to 10 do //écriture des position finales
		BEGIN
			textcolor(13);
			write(Tlettre(k),' ');
			for l := 1 to 10 do
				BEGIN
					if (joueur2[k,l] <> 'x ') then
					BEGIN
						joueur2[k,l] := '+ ';
						textcolor(15);
						write(joueur2[k,l]);
					end;
					if (joueur2[k,l] = 'x ') then
					BEGIN
						textcolor(2);
						write(joueur2[k,l]);
					end;
				end;
				writeln;
		end;
	end;
end;


procedure jeu;
//BUT : Chacun des joueurs doit marquer les positions sur le tableau ennemie
//ENTREE : les differentes coord 
//sortie : tableau avec des 0 bleu si ça ne touche pas et O rouge si ça touche 
BEGIN
		writeln('le joueur1 doit jouer !!');
		writeln('veuillez entrer les abscisses du ', TBateau(o), ' ennemie');
		readln(coord.position.x);
		writeln('veuillez entrer les ordonnes du ', TBateau(o), ' ennemie');
		readln(coord.position.y);
		for k:= 1 to 10 do
			for l:=1 to 10 do
				if(blank_1[k,l] = 'O ')then
					joueur2[k,l] := 'O '
				else if (blank_1[k,l] = '0 ')then
					joueur2[k,l] := '0 '
				else
					blank_1[k,l] := joueur2[k,l];//copier le tableau Joueur 2 dans blank_1

		for k:= 1 to 10 do
		begin
			for l := 1 to 10 do 
			BEGIN
				if(blank_1[coord.position.x,coord.position.y] = 'x ') then
					blank_1[coord.position.x,coord.position.y] := 'O '
				else if(blank_1[coord.position.x,coord.position.y] = '+ ')then
					blank_1[coord.position.x,coord.position.y] := '0 ';				
				
				if (blank_1[k,l] = 'x ')then
					blank_1[k,l] := '+ ';
				if (blank_1[k,l] = 'O ') then
				begin
					textcolor(12);
					write(blank_1[k,l]);
				end
				else if (blank_1[k,l] = '0 ') then
				begin
					textcolor(9);
					write(blank_1[k,l]);
				end
				else if (blank_1[k,l] = '+ ') then
				begin
					textcolor(15);
					write(blank_1[k,l]);
				end;
			
			end;
		writeln;
		end;
	

		writeln('le joueur 2 doit jouer !!');
		writeln('veuillez entrer les abscisses du ', TBateau(o), ' ennemie');
		readln(coord.position.x);
		writeln('veuillez entrer les ordonnes du ', TBateau(o), ' ennemie');
		readln(coord.position.y);
		for k:= 1 to 10 do
			for l:=1 to 10 do
				if(blank_2[k,l] = 'O ')then
					joueur1[k,l] := 'O '
				else if (blank_2[k,l] = '0 ')then
					joueur1[k,l] := '0 '
				else
					blank_2[k,l] := joueur1[k,l];//copier le tableau Joueur 1 dans blank_2

		for k:= 1 to 10 do
		begin
			for l := 1 to 10 do 
			BEGIN
				if(blank_2[coord.position.x,coord.position.y] = 'x ') then
					blank_2[coord.position.x,coord.position.y] := 'O '
				else if(blank_2[coord.position.x,coord.position.y] = '+ ')then
					blank_2[coord.position.x,coord.position.y] := '0 ';				
				
				if (blank_2[k,l] = 'x ')then
					blank_2[k,l] := '+ ';
				if (blank_2[k,l] = 'O ') then
				begin
					textcolor(12);
					write(blank_2[k,l]);
				end
				else if (blank_2[k,l] = '0 ') then
				begin
					textcolor(9);
					write(blank_2[k,l]);
				end
				else if (blank_2[k,l] = '+ ') then
				begin
					textcolor(15);
					write(blank_2[k,l]);
				end;
			end;
		writeln;
		end;
		for k:= 1 to 10 do
			begin
				for l := 1 to 10 do
					begin
						if(joueur2[k,l] <> 'x ')then
						m:= m + 1;
						if(joueur1[k,l] <> 'x ')then
						n:= n + 1;
					end;
			end;	
end;

BEGIN
clrscr;
textcolor(10);
writeln;
writeln('                                           ========================');
writeln('                                            ||LA BATAILLE NAVALE||');
writeln('                                           ========================');	
writeln;
writeln;
writeln('vous avez cinq bateaux a placer sur une grille ave des coordonnees allant de 1 a 10 et A a J');
writeln('votre ennemie à le meme nombre de bateaux et la meme grille vous devez detruit les bateaux adverse');

textcolor(11);
writeln('pour commencer le joueur 1 doit placer ses 5 bateaux');
writeln;
textcolor(11);
o :=5;
init_joueur1;
readln;
clrscr;
textcolor(11);
writeln('pour commencer le joueur 2 doit placer ses 5 bateaux');
o :=5;
textcolor(13);
init_joueur2;
o :=5;
readln;
clrscr;
repeat
jeu;
if(m = 100)then
	begin
		writeln('LE JOUEUR 1 A GAGNER');
	end
else if(n = 100)then
	begin
		writeln('LE JOUEUR 2 A GAGNER');
	end;
until((m = 100) or (n = 100));
readln;
END.