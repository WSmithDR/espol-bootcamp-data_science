create database taller_10_01_2025;
use taller_10_01_2025;


create table hotel (
hotel_id int primary key,
name varchar(50) not null,
country varchar(250) not null,
city varchar(250) not null,
address varchar(500) not null,
phone varchar(50) unique not null,
stars_rating int check ( stars_rating>=0 and stars_rating <=5)
);

create table room_type (
room_type_id int primary key,
name varchar(50) unique not null,
num_beds int not null,
price float not null,
is_vip boolean not null
);

create table user (
user_id int primary key,
firstname varchar(25) not null,
lastname varchar(25) not null,
gender enum('male','female','other','non-binary','prefer not to say'),
email varchar(250) not null,
cellphone varchar(50),
passport varchar(25),
nationality varchar(25) not null,
password varchar(12)
);

create table room (
room_id int primary key,
code varchar(10),
is_available boolean,
room_type_id int,
hotel_id int,
foreign key (room_type_id) references room_type(room_type_id),
foreign key (hotel_id) references hotel(hotel_id)
);

create table booking(
booking_date datetime,
arrival_date datetime,
departure_date datetime,
num_adults int,
num_children int,
special_requirements text,
hotel_id int not null,
room_id int not null,
user_id int not null,
foreign key (hotel_id) references hotel(hotel_id),
foreign key (room_id) references room(room_id),
foreign key (user_id) references user(user_id)
);