#Selecionar Credenciados de certas cidades
#PS precisa saber o id ,  id 2969 = Tres Lagoas
#=======================  id 2933 = Ponta Pora



select p.nome , p.telefone_fixo , p.telefone_movel , p.endereco
from sipas.prestador p
where p.id_cidade = '2969'