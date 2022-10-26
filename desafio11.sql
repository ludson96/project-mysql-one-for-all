SELECT 
    cancoes AS nome_musica,
    CASE
        WHEN cancoes LIKE '%Bard%' THEN REPLACE(cancoes, 'Bard', 'QA')
        WHEN cancoes LIKE '%Amar%' THEN REPLACE(cancoes, 'Amar', 'Code Review')
        WHEN
            cancoes LIKE '%Pais%'
        THEN
            REPLACE(cancoes,
                'Pais',
                'Pull Requests')
        WHEN cancoes LIKE '%SOUL%' THEN REPLACE(cancoes, 'SOUL', 'CODE')
        WHEN
            cancoes LIKE '%SUPERSTAR%'
        THEN
            REPLACE(cancoes,
                'SUPERSTAR',
                'SUPERDEV')
        ELSE NULL
    END AS novo_nome
FROM
    SpotifyClone.cancoes
WHERE
    cancoes IN ('The Bard’s Song' , 'O Medo de Amar é o Medo de Ser Livre',
        'Como Nossos Pais',
        'BREAK MY SOUL',
        'ALIEN SUPERSTAR')
ORDER BY cancoes DESC