-- ======== Users ======== --

create table users (
	id serial primary key,
	first_name varchar(50),
	last_name varchar(50),
	email varchar(100)
);

select * from users;

insert into users ( first_name, last_name, email) values
('Charlie', 'Towers', 'charli@yahoo.com'),
('Yesid', 'Santacruz', 'santayesid@gmail.com'),
('Marino', 'Orozco', 'marino@hotmail.com');

-- ========= Posts ======== --

create table posts (
	id serial primary key,
	creator_id int references users(id),
	tittle varchar(100),
	text text
);

select * from posts;

insert into posts ( creator_id, tittle, text) values
( 1, 'Primer Post', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
( 2, 'Segundo Post', 'Nam rutrum malesuada dui id finibus.'),
( 3, 'Tercer Post', 'Morbi arcu nulla, congue ac erat sed, mattis porta justo.'),
( 1, 'Cuarto Post', 'Aenean maximus purus a sem bibendum, sed auctor arcu gravida.'),
( 2, 'Quinto Post', 'Morbi arcu est, condimentum ac turpis non, placerat finibus sem.');

-- ========= Likes ========= --

create table likes (
	id serial primary key,
	user_id int references users(id),
	post_id int references posts(id)
);

select * from likes;

insert into likes (user_id, post_id) values
(2, 6),
(3, 7),
(1, 8),
(3, 9),
(1, 10);

-- Traer todos los posts y la info del usuario del campo creator_id --

select posts.id, users.first_name ||' '|| users.last_name AS creator, posts.tittle, posts.text
from posts
join users on posts.creator_id = users.id;

-- Trae todos los posts, con la información de los usuarios que les dieron like.--

select posts.id, posts.tittle, posts.text, users.first_name ||' '|| users.last_name AS user_liked
from posts
join likes on posts.id = likes.post_id
join users on likes.user_id = users.id;