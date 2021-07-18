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

##table : <br/>
items : <br/>
| Field | Type        | Null | Key | Default | Extra | <br/>
| id    | int(11)     | NO   | PRI | NULL    |       | <br/>
| name  | varchar(50) | YES  |     | NULL    |       | <br/>
| price | int(11)     | YES  |     | NULL    |       | <br/>

categories :
| Field | Type        | Null | Key | Default | Extra | <br/>
| id    | int(11)     | NO   | PRI | NULL    |       | <br/>
| name  | varchar(50) | YES  |     | NULL    |       | <br/>

item_categories :
| Field       | Type    | Null | Key | Default | Extra | <br/>
| item_id     | int(11) | NO   | MUL | NULL    |       | <br/>
| category_id | int(11) | NO   | MUL | NULL    |       | <br/>

users :
| Field    | Type        | Null | Key | Default | Extra | <br/>
| id       | int(11)     | NO   | PRI | NULL    |       | <br/>
| username | varchar(50) | YES  |     | NULL    |       | <br/>
| password | varchar(10) | YES  |     | NULL    |       | <br/>
| phone    | varchar(20) | YES  | UNI | NULL    |       | <br/>
| role     | varchar(20) | YES  |     | NULL    |       | I use role, to make a authorization who can access the menu/entity

orders : 
| Field      | Type    | Null | Key | Default             | Extra | <br/>
| id         | int(11) | NO   | PRI | NULL                |       | <br/>
| user_id    | int(11) | NO   | MUL | NULL                |       | <br/>
| total      | int(11) | YES  |     | NULL                |       | I'm using total in order to make normalization, if I use total using order_detials it would be slow. <br/>
| order_date | date    | NO   |     | current_timestamp() |       | <br/>

order_details :  <br/>
| Field    | Type    | Null | Key | Default | Extra | <br/>
| id       | int(11) | NO   | PRI | NULL    |       | <br/>
| order_id | int(11) | NO   | MUL | NULL    |       | <br/>
| item_id  | int(11) | YES  | MUL | NULL    |       | <br/>
| price    | int(11) | YES  |     | NULL    |       | I use price becasue in the future if price is changed, the history order will be updated. <br/>
| quantity | int(11) | YES  |     | NULL    |       | <br/>

## homework.txt 
select orders.id as 'Order ID', orders.order_date as 'Order Date', users.username as 'Customer name', users.phone as 'Customer phone', <br/>
orders.total,  //take from table orders  <br/>
group_concat(items.name) as 'Items bought' //take all name from table items <br/>
from orders <br/>
left join users on users.id = orders.user_id <br/>
left join order_details on order_details.order_id = orders.id <br/> 
left join item_categories on item_categories.item_id = order_details.item_id //I use item_categories, beacuse if owner want best seller category, we can show it without change <br/> 
                                                                             //the table's structure and item_cateogries is a pivot table <br/>
left join items on items.id = item_categories.item_id                          
group by orders.id //grouping based on id in table order and in order not to make duplication record <br/>
order by 1; //sorting the record <br/>
