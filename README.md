# day 6 : 7-16-2021

## homework
case :
* homework.png
* hasil.png

file :
* raw_db is database file that I have copied from ../mysql/data file 
* homework.txt is file for coding
* pos.sql is code file for making db
* result.png is a result based on hasil.png

##table :
items :
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| id    | int(11)     | NO   | PRI | NULL    |       |
| name  | varchar(50) | YES  |     | NULL    |       |
| price | int(11)     | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+

categories :
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| id    | int(11)     | NO   | PRI | NULL    |       |
| name  | varchar(50) | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+

item_categories :
+-------------+---------+------+-----+---------+-------+
| Field       | Type    | Null | Key | Default | Extra |
+-------------+---------+------+-----+---------+-------+
| item_id     | int(11) | NO   | MUL | NULL    |       |
| category_id | int(11) | NO   | MUL | NULL    |       |
+-------------+---------+------+-----+---------+-------+

users :
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| id       | int(11)     | NO   | PRI | NULL    |       |
| username | varchar(50) | YES  |     | NULL    |       |
| password | varchar(10) | YES  |     | NULL    |       |
| phone    | varchar(20) | YES  | UNI | NULL    |       |
| role     | varchar(20) | YES  |     | NULL    |       | I use role, to make a authorization who can access the menu/entity
+----------+-------------+------+-----+---------+-------+

orders : 
+------------+---------+------+-----+---------------------+-------+
| Field      | Type    | Null | Key | Default             | Extra |
+------------+---------+------+-----+---------------------+-------+
| id         | int(11) | NO   | PRI | NULL                |       |
| user_id    | int(11) | NO   | MUL | NULL                |       |
| total      | int(11) | YES  |     | NULL                |       | I'm using total in order to make normalization, if I use total using order_detials it would be slow. 
| order_date | date    | NO   |     | current_timestamp() |       |
+------------+---------+------+-----+---------------------+-------+

order_details : 
+----------+---------+------+-----+---------+-------+
| Field    | Type    | Null | Key | Default | Extra |
+----------+---------+------+-----+---------+-------+
| id       | int(11) | NO   | PRI | NULL    |       |
| order_id | int(11) | NO   | MUL | NULL    |       |
| item_id  | int(11) | YES  | MUL | NULL    |       |
| price    | int(11) | YES  |     | NULL    |       | I use price becasue in the future if price is changed, the history order will be updated. 
| quantity | int(11) | YES  |     | NULL    |       |
+----------+---------+------+-----+---------+-------+

## homework.txt 
select orders.id as 'Order ID', orders.order_date as 'Order Date', users.username as 'Customer name', users.phone as 'Customer phone',
orders.total,  //take from table orders 
group_concat(items.name) as 'Items bought' //take all name from table items
from orders
left join users on users.id = orders.user_id
left join order_details on order_details.order_id = orders.id 
left join item_categories on item_categories.item_id = order_details.item_id //I use item_categories, beacuse if owner want best seller category, we can show it without change 
                                                                             //the table's structure and item_cateogries is a pivot table
left join items on items.id = item_categories.item_id                           
group by orders.id //grouping based on id in table order and in order not to make duplication record
order by 1; //sorting the record
