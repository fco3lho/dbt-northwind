with 
    fonte_funcionarios as (
        select *
        from {{ source('erp_northwind', 'employee') }}
    )
    
    , renomeacao as (
        select 
        	cast(ID as int) as pk_funcionario
            , cast(REPORTSTO as int) as fk_gerente
            , cast(BIRTHDATE as date) as dt_nascimento_funcionario
            , cast(HIREDATE as date) as dt_contratacao
            , FIRSTNAME || ' ' || LASTNAME as nome_funcionario
            , cast(TITLE as varchar) as cargo_funcionario
            , cast(CITY as varchar) as cidade_funcionario
            , cast(REGION as varchar) as regiao_funcionario
            , cast(COUNTRY as varchar) as pais_funcionario
            --, cast(HOMEPHONE as varchar)
            --, cast(EXTENSION as varchar)
            --, cast(PHOTO as varchar)
            --, cast(NOTES as varchar)
            --, cast(PHOTOPATH as varchar
            --, cast(TITLEOFCOURTESY as varchar)
            --, cast(ADDRESS as varchar)
            --, cast(POSTALCODE as varchar)
        from fonte_funcionarios
    )

select *
from renomeacao
