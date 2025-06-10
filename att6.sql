#1. Quais são todos os dados da localidade chamada 'Boa Vista'?
select * from localidade where nome_localidade = 'Boa Vista';
#2. Mostre os detalhes da zona eleitoral com id_zona_eleitoral = 10.
select * from zona_eleitoral where id_zona_eleitoral = 10;
#3. Liste todas as localidades cujo nome começa com 'San'.
select * from localidade where nome_localidade like 'San%';
#4. Quais são as zonas eleitorais que contêm 'Central' em seu nome?
select * from zona_eleitoral where nome_zona_eleitoral like '%Central%';
#5. Quais são os nomes e números das zonas eleitorais localizadas em 'Parnamirim'?
select ze.nome_zona_eleitoral, ze.numero_zona_eleitoral  from zona_eleitoral as ze inner join localidade as l on l.id_localidade = ze.id_localidade where l.nome_localidade = "Parnamirim";
#6. Qual é o nome da localidade onde a zona eleitoral 'Zona Universitária' está situada?
select l.nome_localidade from localidade as l inner join zona_eleitoral as ze on ze.id_localidade = l.id_localidade where ze.nome_zona_eleitoral = 'Zona Universitária';
#7. Quais localidades possuem zonas eleitorais cujo nome termina com a letra 'A'?
select * from localidade as l inner join zona_eleitoral as ze on ze.id_localidade = l.id_localidade where ze.nome_zona_eleitoral like "%A";
#8. Exiba o nome e o número das zonas eleitorais situadas em localidades cujo nome contém 'Amaro'.
select nome_localidade, numero_zona_eleitoral from zona_eleitoral as ze inner join localidade as l on ze.id_localidade = l.id_localidade where l.nome_localidade like "%Amaro%";
#9. Liste o nome_zona_eleitoral e nome_localidade para todas as zonas eleitorais que têm um numero_zona_eleitoral maior que 110 e estão localizadas em localidades cujo nome começa com 'C'.
select ze.nome_zona_eleitoral, l.nome_localidade from zona_eleitoral as ze inner join localidade as l on ze.id_localidade = l.id_localidade where ze.numero_zona_eleitoral > 110 and l.nome_localidade like "C%";
#10. Encontre todos os pares de nome_localidade e nome_zona_eleitoral onde o nome da localidade contém 'Ilha' e o nome da zona eleitoral contém 'Ribeirinha'.
select * from localidade as l inner join zona_eleitoral as ze on ze.id_localidade = l.id_localidade where l.nome_localidade like "%Ilha%" and ze.nome_zona_eleitoral like "%Ribeirinha%";