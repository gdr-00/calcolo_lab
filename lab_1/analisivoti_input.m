clear all
crediti = input('inserire array di crediti degli esami conseguiti: ')
voti = input('inserire array di voti degli esami conseguiti: ')
pesi = sum(crediti);
mediana = median(voti);
media = sum(voti)/max(size(voti));
media_pesata = sum(voti.*crediti)/pesi;

fprintf('la mediana è %1.2f\nla media è %1.2f\nla media pesata è %1.2f\nil voto massimo è %1.2f\nil voto minimo è %1.2f\n', mediana, media, media_pesata, max(voti), min(voti))
