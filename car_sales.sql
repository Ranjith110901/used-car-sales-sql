-- Used Car Sales Analysis
-- Author: Ranjith Radha Senthilkumar
-- Date: July 2025


SELECT * FROM car_sales.second_hand_car_sales;

-- activating the Database
use car_sales;

-- Rename the column 
alter table second_hand_car_sales
change `Engine Size (L)` engine_size decimal(10,2),
change `Fuel Type` fuel_type varchar(50),
change `Year of Manufacture` year_of_manufacture int,
change `Price (Â£)` price int;

-- 1.Total number of cars in the dataset
select count(*) as total_cars 
from second_hand_car_sales;

-- 2.Top 5 most common car manufacturers
select Manufacturer, count(*) as total
from second_hand_car_sales
group by Manufacturer
order by total desc
limit 5;

-- 3.Average price of cars by fuel type
select fuel_type, avg(price) as average_price
from second_hand_car_sales
group by fuel_type;

-- 4.View all records in the dataset
select * from second_hand_car_sales;


-- 5.Average mileage for each manufacturer
select Manufacturer, avg(Mileage) as average_price
from second_hand_car_sales
group by Manufacturer;

-- 6. Cars with engine size greater than 2.0 litres
select * from second_hand_car_sales
where engine_size > 2.0;

-- 7.Maximum and minimum price for each manufacturer
select Manufacturer, MAX(price) as maximun_price, MIN(price) as minimum_price
from second_hand_car_sales
group by manufacturer;

-- 8.Min and max price by manufacturer
SELECT manufacturer, MIN(price) AS min_price, MAX(price) AS max_price
FROM second_hand_car_sales
GROUP BY manufacturer;

-- 9.Number of cars manufactured each year
select year_of_manufacture, count(*) as total
from second_hand_car_sales
group by year_of_manufacture
order by year_of_manufacture;

-- 10.Average engine size by fuel type
SELECT fuel_type, avg(engine_size) as average_engine_size
from second_hand_car_sales
group by fuel_type;
 
-- 11.Manufacturers with cars priced above the overall average
select distinct manufacturer
from second_hand_car_sales
where price > (select avg(price) from second_hand_car_sales);

-- 12.Top 5 most expensive cars in the dataset
select manufacturer,model,price
from second_hand_car_sales 
order by price desc
limit 5;

