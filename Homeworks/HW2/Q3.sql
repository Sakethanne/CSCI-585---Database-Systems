/*
 *USC ID: 3725520208
 *Database used: MySQL
 *IDE used: Dbeaver and MySQL workbench
 */

/*
 * Below are the queries that are required to create the required tables and insert the data into them.
 */
create database DB;

USE DB;

CREATE TABLE DB.users( userid int PRIMARY KEY, name varchar(40), address varchar(300), email varchar(60), age int, contact varchar(12), isconsumer boolean, iscreator boolean);

INSERT INTO DB.users (userid, name, address, email, age, contact, isconsumer, iscreator) VALUES
(1, 'Saketh Anne', '1256 W 29th Street Los Angeles CA United States of America 90007', 'saketh@gmail.com', 24, '2133121232', 1, 0),
(2, 'Ann Robert', '815 James St Wilmington MA United States of America 01887', 'robert@gmail.com', 21, '21838475758', 1, 0),
(3, 'John Teddy', '10 Tailwater Road Canal Winchester OH United States of America 43110', 'john@gmail.com', 31, '7473729173', 1, 0),
(4, 'Carol Lucas', '8691 Rose Street Lilburn INDIA 30047', 'carol@gmail.com', 35, '9876514274', 0, 1),
(5, 'Christopher Nolan', '39 Edgemont Road Englishtown NJ United States of America 07726', 'christopher@gmail.com', 54, '8475837485', 0, 1),
(6, 'Sundar Pichai', '6 Ridgeview Street Morganton NC United States of America 28655', 'sundar@gmail.com', 32, '9812346573', 1, 1),
(7, 'Gokulnath Varadhan', '57 Sherman Drive San Jose CA United States of America 95127', 'gokulnath@gmail.com', 40, '3372687152', 1, 0),
(8, 'Kumar Seth', '283 Front Avenue Biloxi United Kingdom 39532', 'kumar@gmail.com', 66, '8743567125', 1, 0),
(9, 'Tim Cook', '58 Walt Whitman Avenue Camas WA United States of America 98607', 'tim@gmail.com', 56, '8712069127', 1, 0),
(10, 'Lucas Columbo', '376 Riverview Drive Bridgeton Greece 08302', 'lucas@gmail.com', 31, '73846571625', 1, 1),
(11, 'Taylor Swift', '7118 New Saddle Ave. Ypsilanti United States of America 48197', 'taylor@gmail.com', 76, '81726456378', 1, 1),
(12, 'Marvel Entertainment', '8570 South High Noon Court Olney MD United States of America 20832', 'marvel@gmail.com', 53, '9283474657', 0, 1),
(13, 'Marques Brownlee', '61 East Morris Street Council Bluff Spain 51501', 'marques@gmail.com', 33, '4352687611', 0, 1),
(14, 'Dominic King', '986 San Carlos St. Eau Claire Hungary 54701', 'dominic@gmail.com', 22, '6877548736', 0, 1),
(15, 'Maxwell Roman', '7963 Dunbar St. Worcester United States of America 01604', 'maxwell@gmail.com', 18, '8374567123', 1, 0);

create table creators( userid int PRIMARY KEY, subscriber_count int, videos_count int, FOREIGN KEY(userid) references users(userid));

INSERT INTO creators VALUES
(4,50000,50),
(5,1000000,60),
(6,3400000,70),
(10,4300000,80),
(11,450000,550),
(12,1200900,100),
(13,4700000,900),
(14,1204300,700);

create table consumers( userid int PRIMARY KEY, subscriptions_count int, likedvideos_count int, FOREIGN KEY(userid) references users(userid));

INSERT INTO consumers VALUES
(1,20,500),
(2,40,600),
(3,60,700),
(6,78,280),
(7,23,800),
(8,43,100),
(9,12,250),
(10,54,260),
(11,76,270),
(15,87,310);

create table channels( channelid int PRIMARY KEY, name varchar(50), subscriptions int, views_count int, channel_creation_date datetime, userid int, FOREIGN KEY(userid) references users(userid));

INSERT INTO DB.channels (channelid, name, subscriptions, views_count, channel_creation_date, userid) VALUES
(1, 'Taylor Swift', 20000, 890000, '2023-01-01 00:10:00', 11),
(2, 'Iron Man', 40000, 1000000, '2023-01-01 00:20:00', 12),
(3, 'Black Widow', 50000, 20000000, '2023-01-01 00:15:00', 12),
(4, 'Avengers', 60000, 200000, '2022-01-01 00:10:00', 12),
(5, 'Car Wow', 30000, 3040550, '2022-10-01 00:10:00', 14),
(6, 'Autocar', 25000, 700000, '2022-01-10 00:10:00', 14),
(7, 'MKBHD', 12000, 10000, '2023-02-01 10:10:00', 13),
(8, 'Verge', 34000, 30000, '2022-04-01 00:10:00', 14),
(9, 'HBR', 45000, 40000, '2022-09-01 00:10:00', 10),
(10, 'Apple', 90000, 10000, '2022-11-01 00:10:00', 10),
(11, 'MR Beast', 100000, 70000, '2023-01-10 00:10:00', 10),
(12, 'Food Review', 30000, 80000, '2022-08-10 00:10:00', 4),
(13, 'Insider', 200000, 30000, '2021-01-01 00:10:00', 4),
(14, 'Techcrunch', 50000, 89000, '2020-01-01 00:10:00', 5),
(15, 'AndroidPolice', 40000, 98700, '2021-10-01 00:10:00', 6);

create table subscriptions( subscriptionid int PRIMARY KEY, type_of_subscription varchar(6), userid int, channelid int, date_of_subscription datetime, FOREIGN KEY(userid) references users(userid), FOREIGN KEY(channelid) references channels(channelid));

INSERT INTO DB.subscriptions (subscriptionid, type_of_subscription, userid, channelid, date_of_subscription) VALUES
(1, 'Free', 1, 2, '2021-01-01 00:10:00'),
(2, 'Free', 1, 3, '2022-02-02 00:10:00'),
(3, 'Free', 2, 3, '2023-02-03 00:10:00'),
(4, 'Free', 3, 2, '2021-04-04 00:10:00'),
(5, 'Paid', 6, 4, '2022-05-05 00:10:00'),
(6, 'Paid', 7, 1, '2023-02-06 00:10:00'),
(7, 'Free', 8, 1, '2021-07-07 00:10:00'),
(8, 'Paid', 9, 2, '2022-08-08 00:10:00'),
(9, 'Free', 10, 3, '2023-02-09 00:10:00'),
(10, 'Paid', 11, 7, '2021-10-10 00:10:00'),
(11, 'Free', 1, 8, '2022-11-11 00:10:00'),
(12, 'Free', 2, 9, '2023-02-12 00:10:00'),
(13, 'Free', 15, 10, '2021-01-13 00:10:00'),
(14, 'Paid', 10, 11, '2022-02-14 00:10:00'),
(15, 'Free', 11, 12, '2023-02-15 00:10:00');

create table videos( videoid int PRIMARY KEY, url varchar(300), title varchar(200), category varchar(50), duration_in_min int, uploadtime datetime, channelid int, userid int, likes int, dislikes int, views int, comments int, shares int, FOREIGN KEY(channelid) references channels(channelid), FOREIGN KEY(userid) references users(userid));

INSERT INTO DB.videos (videoid, url, title, category, duration_in_min, uploadtime, channelid, userid, likes, dislikes, views, comments, shares) VALUES
(1, 'youtube.com/sjdfbhdjsf', 'Marvel iron man', 'E', 4, '2023-01-01 00:10:00', 2, 12, 2000, 100, 100000, 1000, 400),
(2, 'youtube.com/iuewdhs', 'Marvel iron woman', 'E', 5, '2023-01-08 00:10:00', 2, 12, 30000, 1220, 992920, 1000, 540),
(3, 'youtube.com/dhijskad', 'Marvel ant man', 'E', 4, '2023-01-15 00:10:00', 2, 12, 50000, 420, 4545340, 320, 430),
(4, 'youtube.com/dhuejsa', 'Avengers Infinite War', 'E', 4, '2023-01-22 00:10:00', 2, 12, 21320, 4320, 432210, 120, 430),
(5, 'youtube.com/uehdsj', 'MCU', 'E', 10, '2023-01-28 00:10:00', 2, 12, 2132130, 3210, 312321310, 210, 450),
(6, 'youtube.com/edhgjsad', 'Marvel iron man 2', 'E', 20, '2023-01-09 00:10:00', 3, 12, 3250, 30, 53230, 350, 3550),
(7, 'youtube.com/yehdjas', 'Marvel iron man 3', 'E', 30, '2022-02-09 00:10:00', 4, 12, 352550, 230, 5325230, 50, 3520),
(8, 'youtube.com/dhjashj', 'Avengers 1', 'E', 10, '2022-01-09 00:10:00', 4, 12, 352350, 4350, 564234240, 4320, 540),
(9, 'youtube.com/whjdash', 'Avengers 2', 'E', 20, '2021-02-09 00:10:00', 4, 12, 560, 430, 3240, 450, 10),
(10, 'youtube.com/uwedhas', 'Avengers 3', 'E', 40, '2023-02-10 00:10:00', 3, 12, 3520, 230, 241410, 120, 430),
(11, 'youtube.com/ygadshj', 'Worth it', 'E', 5, '2023-01-10 00:10:00', 1, 11, 3420, 340, 213420, 120, 430),
(12, 'youtube.com/ujhsda', 'Deemed', 'E', 4, '2022-01-01 00:10:00', 1, 11, 520, 320, 23430, 210, 120),
(13, 'youtube.com/uwahdjs', 'Blank Space', 'E', 4, '2022-03-10 00:10:00', 1, 11, 320, 2340, 2342340, 340, 20),
(14, 'youtube.com/yuhejdas', 'Anti hero', 'E', 4, '2022-03-15 00:10:00', 1, 11, 43240, 3240, 43242230, 3240, 230),
(15, 'youtube.com/uhjsadas', 'Shake it off', 'E', 5, '2021-12-09 00:10:00', 1, 11, 32420, 30, 2343420, 320, 230),
(16, 'youtube.com/uhadsjas', 'Hyundai Review', 'I', 50, '2022-12-09 00:10:00', 6, 14, 5454330, 340, 233242340, 230, 230),
(17, 'youtube.com/ahjds', 'BMW review', 'I', 40, '2021-12-12 00:10:00', 6, 14, 2340, 230, 324230, 450, 120),
(18, 'youtube.com/yuhajds', 'Samsung Review', 'I', 30, '2022-12-13 00:10:00', 7, 13, 3240, 320, 324340, 1230, 120),
(19, 'youtube.com/uydasjh', 'Google Review', 'I', 20, '2021-11-14 00:10:00', 7, 13, 340, 120, 34230, 210, 120),
(20, 'youtube.com/eyausdhj', 'Apple review', 'I', 10, '2020-02-09 00:10:00', 8, 14, 230, 1230, 3213210, 10, 120);

create table comments( commentid int PRIMARY KEY, commenttext varchar(1000), likes int, sentiment int, commentdate datetime, videoid int, userid int, FOREIGN KEY(userid) references users(userid), FOREIGN KEY(videoid) references videos(videoid));

INSERT INTO DB.comments (commentid, commenttext, likes, sentiment, commentdate, videoid, userid) VALUES
(1, 'guyfwewsahdfjyf', 20, 1, '2020-01-01 00:10:05', 11, 1), 
(2, 'rwgfsdadsfasdfasd', 430, 2, '2021-02-01 00:10:20', 11, 1),
(3, 'gdfdfgdfgdfgdf', 320, 1, '2022-03-01 00:10:20', 11, 2),
(4, 'regfdgdfdfgfdgdffh', 20, 2, '2023-02-01 00:10:20', 12, 3),
(5, 'rgedfgjdfghsdfgfdsfgh', 650, 3, '2020-05-01 00:10:50', 13, 6),
(6, 'sdfhgfdfdgdfgdfgfgsdfgg', 730, 4, '2021-06-01 00:10:30', 13, 7),
(7, 'varetreysteuryurtvwtrey', 70, 6, '2022-07-01 00:10:20', 13, 2),
(8, 'brteyeyrttrbyreyrtbrbty', 3240, 4, '2023-02-01 00:10:10', 12, 3),
(9, 'esrtbevsstytryescsretre', 230, 6, '2020-09-01 00:10:50', 12, 1),
(10, 'vsetyytruyeubyintbyvr', 5230, 5, '2021-10-01 00:10:20', 14, 8),
(11, 'vetetyeturbyvecytvyctyte', 520, 6, '2022-11-01 00:10:50', 14, 9),
(12, 'vestytybuyukkuvyrtcewtectre', 6540, 8, '2023-01-01 00:10:50', 15, 10),
(13, 'vrtydkbfuvjtyhrcsetvrbjuvjcrtetc', 2334, 9, '2020-08-01 00:10:40', 13, 10),
(14, 'gdfsdfadsgsdgfadfdsf', 7650, 2, '2021-09-01 00:10:30', 1, 1),
(15, 'rtsfgdhghdghfjdhdsfdhgfdf', 3420, 1, '2022-10-01 02:10:00', 2, 2),
(16, 'rdgfhfdghsghggfhfghfgf', 4350, 2, '2023-01-01 12:10:00', 3, 3),
(17, 'yhtdgsffghjhfdgjkhf', 2340, 1, '2020-12-01 04:10:00', 4, 11),
(18, 'ergtrdgfsfsgdgsfgfhgd', 320, 6, '2021-04-01 02:10:00', 5, 11),
(19, 'rewrdhfjdertdreretster', 6540, 7, '2022-06-01 10:10:00', 6, 15),
(20, 'yrteretrtytrtytdrtr', 230, 8, '2023-01-01 10:56:03', 7, 15),
(21, 'guyfwewsahdsadasdasdfjyf', 206, 1, '2020-01-01 00:10:05', 16, 1), 
(22, 'rwgfsdadsdasdsadasdfasdfasd', 4630, 2, '2021-02-01 00:10:20', 17, 1),
(23, 'gdfdfgdfsadasdsadsdasgdfgdf', 3620, 1, '2022-03-01 00:10:20', 17, 2),
(24, 'regfdgdfdasdsadasdasdfgfdgdffh', 260, 2, '2023-02-01 00:10:20', 17, 3),
(25, 'rgedfgjdasdasdfefrewfdsafghsdfgfdsfgh', 6650, 3, '2020-05-01 00:10:50', 16, 6),
(26, 'sdfhgfdfyyterwfddgdfgdfgfgsdfgg', 7360, 4, '2021-06-01 00:10:30', 18, 7),
(27, 'ewrewrewfewrfefwdfwedwewdasder', 760, 6, '2022-07-01 00:10:20', 18, 2),
(28, 'brteyefwesdaesyrttrbyreyrtbrbty', 32640, 4, '2023-02-01 00:10:10', 19, 3),
(29, 'esrtbeerwewesadvsstytryescsretre', 2360, 6, '2020-09-01 00:10:50', 19, 1),
(30, 'vsetyyteqwerrbetgfdsfruyeubyintbyvr', 56230, 5, '2021-10-01 00:10:20', 20, 8);

create table sponsors( sponsorid int, name varchar(100), address varchar(300), contact varchar(12), amount int, videoid int, FOREIGN KEY(videoid) references videos(videoid), PRIMARY KEY(sponsorid, videoid));

INSERT INTO DB.sponsors (sponsorid, name, address, contact, amount, videoid) VALUES
(1, 'Ferenc Arcelia', 'USA', '6152256850', 2000, 4),
(2, 'Kallisto Tanit', 'USA', '7036786386', 4000, 4),
(2, 'Kallisto Tanit', 'USA', '7036786386', 4000, 5),
(2, 'Kallisto Tanit', 'USA', '7036786386', 4000, 6),
(2, 'Kallisto Tanit', 'USA', '7036786386', 4000, 8),
(3, 'Callias Anneli', 'USA', '5807556450', 1000, 1),
(4, 'Alexandra Ander', 'INDIA', '5027434797', 500, 2),
(5, 'Coeus Shin', 'USA', '2526658447', 300, 3),
(6, 'Silvestre Félix', 'USA', '3134845002', 1000, 5),
(7, 'Boulos Aineias', 'USA', '4048749204', 600, 6),
(8, 'Viorica Idun', 'LONDON', '8452569288', 700, 4),
(9, 'Alda Coen', 'LONDON', '2088393650', 780, 7),
(10, 'Drousilla Lisa', 'USA', '8183248335', 120, 8);

create table entertainment_videos( videoid int PRIMARY KEY, tag varchar(300));

INSERT INTO DB.entertainment_videos (videoid, tag) VALUES
(1, 'MCU'),
(2, 'MCU'),
(3, 'MCU'),
(4, 'MCU'),
(5, 'MCU'),
(6, 'MCU'),
(7, 'MCU'),
(8, 'MCU'),
(9, 'MCU'),
(10, 'MCU'),
(11, 'Music'),
(12, 'Music'),
(13, 'Music'),
(14, 'Music'),
(15, 'Music');

create table informational_videos( videoid int PRIMARY KEY, keyword varchar(300));

INSERT INTO DB.informational_videos (videoid, keyword) VALUES
(16, 'Automobiles'),
(17, 'Automobiles'),
(18, 'Technology'),
(19, 'Technology'),
(20, 'Technology');

/*
 * SUB QUERY: We are extracting the user name from the users table, email from the users email, the channel name from the channels table and the count of subscribtions from the subscriptions table
 * 			now we join the results with creators table with the channels table on the usersid field, then we join the users table with the creators table on the userid field
 * 			then we join the subscriptions table with the channel table on the field channelid
 * 			WHERE CLAUSE: here we check the channel creation date with the given condition, I am using the DATE() function to convert the datetime value into DATE value in MYSQL.
 * 			and then we use the where condition on the subscription type as 'Paid' to get only the list of paid subscriptions.
 * OUTER QUERY: We use the outer query to group the records on the columns and only get the values of the rows which have the number of paid subscribers more than 100
 */

select user_name as "User Name", email as "User Email", channel_name as "Channel Name", count(*) as "Number of Paid Subscribers" 
from (select 
users.name as 'user_name', users.email, channels.name as 'channel_name', COUNT(subscriptions)
from channels
join creators on creators.userid = channels.userid 
join users on creators.userid = users.userid
join subscriptions on subscriptions.channelid = channels.channelid
where DATE(channels.channel_creation_date) = DATE('2023-01-01')
and subscriptions.type_of_subscription = 'Paid'
group by subscriptions.userid, users.name, users.email, channels.name) t1
group by user_name, email, channel_name
having count(*) > 100;

/*
 *The above query shall work by fetching the number of subscribers that are paid from the subscriptions table, 
 *but currently since there is not sufficient data in the subscriptions table, you can test the query with a value of '1', for whhich the right data is inserted into the table with the above mentioned queries.
 */