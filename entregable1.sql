create table users(
	id serial primary key,
	first_name varchar(50),
	last_name varchar(50),
	email varchar(100)
);

create table posts(
	id serial primary key,
	creator_id int references users(id),
	title varchar(200),
	text varchar(1000)
);

create table likes(
	id serial primary key,
	user_id int references users(id),
	post_id	int references posts(id)
);


insert into users (first_name, last_name, email) values 
('andres', 'cruz', 'diegocruz@diego.com'),
('james', 'harden', 'harden@james.com'),
('nikola', 'tesla', 'tesla@tesla.com');


insert into posts (creator_id, title, text) values 
(1, 'kickflip', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam in eleifend nibh, id luctus turpis. Aliquam pharetra metus varius lorem consectetur, nec lobortis dolor dapibus. Sed accumsan sapien nulla, a accumsan arcu consectetur id. Duis ligula metus, molestie sed bibendum et, elementum vitae orci. Quisque congue finibus arcu, mollis dignissim velit sollicitudin sed. Aliquam placerat ligula eu metus pharetra aliquam. Phasellus hendrerit felis purus. Morbi scelerisque eros arcu, nec vulputate nisi cursus et. Suspendisse ac lectus faucibus, semper mi vitae, mattis felis.'),
(1, 'pop smoke', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam in eleifend nibh, id luctus turpis. Aliquam pharetra metus varius lorem consectetur, nec lobortis dolor dapibus. Sed accumsan sapien nulla, a accumsan arcu consectetur id. Duis ligula metus, molestie sed bibendum et, elementum vitae orci. Quisque congue finibus arcu, mollis dignissim velit sollicitudin sed. Aliquam placerat ligula eu metus pharetra aliquam. Phasellus hendrerit felis purus. Morbi scelerisque eros arcu, nec vulputate nisi cursus et. Suspendisse ac lectus faucibus, semper mi vitae, mattis felis.'),
(3, 'amsterdam', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam in eleifend nibh, id luctus turpis. Aliquam pharetra metus varius lorem consectetur, nec lobortis dolor dapibus. Sed accumsan sapien nulla, a accumsan arcu consectetur id. Duis ligula metus, molestie sed bibendum et, elementum vitae orci. Quisque congue finibus arcu, mollis dignissim velit sollicitudin sed. Aliquam placerat ligula eu metus pharetra aliquam. Phasellus hendrerit felis purus. Morbi scelerisque eros arcu, nec vulputate nisi cursus et. Suspendisse ac lectus faucibus, semper mi vitae, mattis felis.'),
(1, 'mercurio', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam in eleifend nibh, id luctus turpis. Aliquam pharetra metus varius lorem consectetur, nec lobortis dolor dapibus. Sed accumsan sapien nulla, a accumsan arcu consectetur id. Duis ligula metus, molestie sed bibendum et, elementum vitae orci. Quisque congue finibus arcu, mollis dignissim velit sollicitudin sed. Aliquam placerat ligula eu metus pharetra aliquam. Phasellus hendrerit felis purus. Morbi scelerisque eros arcu, nec vulputate nisi cursus et. Suspendisse ac lectus faucibus, semper mi vitae, mattis felis.'),
(2, '2086', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam in eleifend nibh, id luctus turpis. Aliquam pharetra metus varius lorem consectetur, nec lobortis dolor dapibus. Sed accumsan sapien nulla, a accumsan arcu consectetur id. Duis ligula metus, molestie sed bibendum et, elementum vitae orci. Quisque congue finibus arcu, mollis dignissim velit sollicitudin sed. Aliquam placerat ligula eu metus pharetra aliquam. Phasellus hendrerit felis purus. Morbi scelerisque eros arcu, nec vulputate nisi cursus et. Suspendisse ac lectus faucibus, semper mi vitae, mattis felis.');


insert into likes (user_id, post_id) values 
(1, 3),
(2, 1),
(3, 2),
(1, 5),
(3, 4);

select users.id, users.first_name, users.last_name, users.email, posts.id as post_id, posts.title, posts.text from posts
inner join users on posts.creator_id = users.id

select users.first_name, users.last_name, users.email, likes.post_id, likes.user_id, posts.id, posts.title, posts.text from posts
inner join likes on posts.id = likes.user_id
inner join users on likes.user_id = users.id;

select * from posts
inner join likes on posts.id = likes.user_id
inner join users on likes.user_id = users.id;

select * from posts
inner join users on posts.creator_id = users.id