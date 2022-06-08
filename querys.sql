-- query 1
select AVG(f.tempoUtilizacao) as tempoMedioUtilizacao , e.nome as espaco , a.tipo as tipoAtividade
from mydb.fatoLocacao as f
inner join mydb.espaco as e on e.id = f.espaco_id 
inner join mydb.atividade as a on a.id = f.atividade_id
where f.entrada BETWEEN DATE_ADD(CURRENT_DATE(), INTERVAL -6 month) AND CURRENT_DATE()
group by e.id , a.id 

-- query 2

select e.projetista as projetista, e.nome as espaco, AVG(f.tempoUtilizacao) as tempoMedioUtilizacao  
from mydb.fatoLocacao as f
inner join mydb.espaco as e on e.id = f.espaco_id 
group by e.id order by tempoMedioUtilizacao DESC limit 10