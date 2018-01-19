#Busca historico de inserção/edição e dados do usuario apartir de uma guia(tabelas _audit)

#SQL

SELECT * FROM sipas.revisao r 
JOIN sipas._audit_guia_solicitacao_sp_sadt sp ON sp.rev = r.id
WHERE sp.id  = '%numero_guia%'
