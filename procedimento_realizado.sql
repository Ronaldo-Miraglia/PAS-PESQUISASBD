#Procedimento realizado informando o codigo no ano de 2017

#SQL

select *
from sipas.procedimento p
join sipas.procedimento_executado pe ON p.id = pe.id_procedimento
where pe.status_servico = 'REALIZADO'
and pe.quantidade_realizada >= 1
and pe.data_hora_termino >= '2017-01-01' and pe.data_hora_termino < '2018-01-01'
and p.codigo = '71200029'
