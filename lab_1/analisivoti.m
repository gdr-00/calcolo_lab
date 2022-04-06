clear all
crediti = [12 12 8 6 6 6 3 9 9];
voti = [26 19 27 28 19 27 28 26 28];
pesi = sum(crediti);
mediana = median(voti);
media = sum(voti)/max(size(voti));
media_pesata = sum(voti.*crediti)/pesi;

fprintf('la mediana è %1.2f\nla media è %1.2f\nla media pesata è %1.2f\nil voto massimo è %1.2f\nil voto minimo è %1.2f\n', mediana, media, media_pesata, max(voti), min(voti))
