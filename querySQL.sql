1  Seleziona gli utenti che hanno postato almeno un video:

    select users.username, count(type) as quantita_video, TYPE
    from users 
    inner join medias 
    on users.id = medias.user_id
    where type = 'video'
    group by users.id
    order by quantita_video ASC

2  Seleziona tutti i post senza Like (13):

    select likes.post_id , posts.id , posts.title
    from likes 
    right join posts  
    on likes.post_id = posts.id
    where likes.post_id is null 

3  Conta il numero di like per ogni post (165 nel caso di query con SELECT + JOIN oppure 175 nel caso di query con sola SELECT)

    caso 1
        select  count(likes.user_id) as totale_likes , posts.id, posts.title 
        from likes 
        inner join posts 
        on likes.post_id = posts.id
        group by posts.id 


    caso 2
        select count(`user_id`) 'like', post_id 'id del post'
        from `likes` 
        group by `post_id` 


4  Ordina gli utenti per il numero di media caricati (25)

    SELECT users.username, COUNT(medias.id) as total_media
    FROM users 
    inner JOIN medias 
    ON users.id = medias.user_id
    GROUP BY users.id
    ORDER BY total_media DESC;

5  Ordina gli utenti per totale di likes ricevuti nei loro posts (25) 

    SELECT users.username, COUNT(likes.user_id) as total_like
    FROM users 
    inner JOIN likes
    ON users.id = likes.post_id 
    GROUP BY users.id
    ORDER BY total_like DESC;

