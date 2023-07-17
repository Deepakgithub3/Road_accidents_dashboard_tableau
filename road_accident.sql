#SQL QUERIES 

#CURRENT YEAR CASUALTIES
select sum(number_of_casualties) as CY_Casualties from road_accident
where YEAR(accident_date)= '2022';

#CURRENT YEAR ACCIDENTS
select count(distinct accident_index) as CY_Accidents from road_accident
where YEAR(accident_date) = '2022';

#CURRENT YEAR FATAL CASUALTIES
select sum(number_of_casualties) as CY_Fatal_Casualties
from road_accidents
where YEAR(accident_date) ='2022' and accident_severity ='Fatal';

#CURRENT YEAR SERIOUS CASUALTIES
select sum(number_of_casulaties) as CY_Serious_Casualties
from road_accidents
where YEAR(accident_date)='2022' and accident_severity='Serious';

#CURRENT YEAR SLIGHT CASUALTIES
select sum(number_of_accidents) as CY_Slight_Casualties
from road_accidents
where Year(accident_date) ='2022' and accident_severity='Slight';


#CASUALTIES BY VEHICLE TYPE
select 
      case
		  when vehicle_type in ('Agriculture vehicle') then 'Agricultue'
          when vehicle_type in ('car','Taxi/Private hire car') then 'cars'
          when vehicle_type in ('Motorcycle 125cc and under','Motorcycle 50cc and under', 'Pdeal cycle') then 'Bike'
          when vehicle_type in ('Bus or coach(17 or more pass seats)', 'Minibus (8-16 passenger seats)') then 'Bus'
          when vehicle_type in ('Goods 7.5 tonnes mgw and over','goods over 3.5t. and under 7.5t','Van/Goods 3.5 tonnes mgw or under') then 'Van'
          else 'other'
          end as vehicle_group
          sum(number_of_casualties) as CY_Casualties
      from road_accident
      where YEAR (accident_date) ='2022'
      group by 
              case
		  when vehicle_type in ('Agriculture vehicle') then 'Agricultue'
          when vehicle_type in ('car','Taxi/Private hire car') then 'cars'
          when vehicle_type in ('Motorcycle 125cc and under','Motorcycle 50cc and under', 'Pdeal cycle') then 'Bike'
          when vehicle_type in ('Bus or coach(17 or more pass seats)', 'Minibus (8-16 passenger seats)') then 'Bus'
          when vehicle_type in ('Goods 7.5 tonnes mgw and over','goods over 3.5t. and under 7.5t','Van/Goods 3.5 tonnes mgw or under') then 'Van'
          else 'other'
          end;
          

#CASUALTIES BY ROAD TYPE
select road_type, sum(number_of_casualties) as CY_Casualties from road_accident
where YEAR(accident_date) ='2022'
group by road_type
order by CY_Casualties desc
    
      
          