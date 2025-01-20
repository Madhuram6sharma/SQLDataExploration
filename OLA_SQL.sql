SELECT *
FROM Portfolio..Dataset
WHERE Date is not null;

-- These are the questions which we will answer using this dataset
-- 1. Retrieve all successful bookings:
--2. Find the average ride distance for each vehicle type:
--3. Get the total number of cancelled rides by customers:
--4. List the top 5 customers who booked the highest number of rides:
--5. Get the number of rides cancelled by drivers due to personal and car-related issues:
--6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
--7. Retrieve all rides where payment was made using UPI:
--8. Find the average customer rating per vehicle type:
--9. Calculate the total booking value of rides completed successfully:
--10. List all incomplete rides along with the reasons.

-- Q1 Retrive all successful bookings.
CREATE VIEW Successful_Bookings AS
SELECT *
FROM Portfolio..Dataset
WHERE Booking_Status = 'Success';


-- Q2 Find the average ride distance for each vehicle type?
CREATE VIEW AvgRideDistance_ByVehicleType AS
SELECT AVG(Ride_Distance) as AvgRideDistance, Vehicle_Type
FROM Portfolio..Dataset
WHERE Vehicle_Type is not null
GROUP BY Vehicle_Type;


-- Q3 Get the total number of cancelled rides by customers?
CREATE VIEW RidesCancelledByCustomers AS
SELECT Booking_Status, COUNT(Canceled_Rides_by_Customer) as RidesCancelledByCustomers
FROM Portfolio..Dataset
WHERE Booking_Status = 'Canceled by Customer'
GROUP BY Booking_Status;


-- Q4  List the top 5 customers who booked the highest number of rides?
CREATE VIEW Top5Customers AS
SELECT TOP(5) Customer_ID, COUNT(Booking_ID) as TotalRide
FROM Portfolio..Dataset
GROUP BY Customer_ID
ORDER BY TotalRide DESC;


-- Q5 Get the number of rides cancelled by drivers due to personal and car-related issues?
CREATE VIEW RideCancelledByDriverDueToPersonalReason AS
SELECT COUNT(*) as RidesCancelledByDriver
FROM Portfolio..Dataset
WHERE Canceled_Rides_by_Driver like ('%Personal%');


-- Q6 Find the maximum and minimum driver ratings for Prime Sedan bookings?
CREATE VIEW MaxMinRatingSedan AS
SELECT MIN(Driver_Ratings) AS MinRating, MAX(Driver_Ratings) AS MaxRating, Vehicle_Type
FROM Portfolio..Dataset
WHERE Vehicle_Type = 'Prime Sedan'
GROUP BY Vehicle_Type;


-- Q7 Retrieve all rides where payment was made using UPI?
CREATE VIEW PaymentsByUPI AS
SELECT * 
FROM Portfolio..Dataset
WHERE Payment_Method = 'UPI';


-- Q8 Find the average customer rating per vehicle type
CREATE VIEW AvgCustomerRatingPerVehicleType AS
SELECT TOP(10) AVG(Customer_Rating) as AvgCustomerRating, Vehicle_Type
FROM Portfolio..Dataset
WHERE Vehicle_Type is not null
GROUP BY Vehicle_Type
ORDER BY AvgCustomerRating DESC;


-- Q9 Calculate the total booking value of rides completed successfully
CREATE VIEW TotalBookingValueRideSuccessful AS
SELECT SUM(Booking_Value) as TotalValue
FROM Portfolio..Dataset
WHERE Booking_Status = 'Success';


-- Q10 List all incomplete rides along with the reasons.
CREATE VIEW IncompleteRideReasons AS
SELECT Booking_ID, Incomplete_Rides_Reason
FROM Portfolio..Dataset
WHERE Incomplete_Rides = 'Yes';


-- Q1. Retrieve all successful bookings:
SELECT * FROM Successful_Bookings;
-- Q2. Find the average ride distance for each vehicle type:
SELECT * FROM AvgRideDistance_ByVehicleType;
-- Q3. Get the total number of cancelled rides by customers:
SELECT * FROM RidesCancelledByCustomers;
-- Q4. List the top 5 customers who booked the highest number of rides:
Select * FROM Top5Customers;
-- Q5. Get the number of rides cancelled by drivers due to personal and car-related issues:
SELECT *FROM RideCancelledByDriverDueToPersonalReason;
-- Q6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
SELECT * FROM MaxMinRatingSedan;
-- Q7. Retrieve all rides where payment was made using UPI:
SELECT * FROM PaymentsByUPI;
-- Q8. Find the average customer rating per vehicle type:
SELECT * FROM AvgCustomerRatingPerVehicleType;
-- Q9. Calculate the total booking value of rides completed successfully:
SELECT * FROM TotalBookingValueRideSuccessful;
-- Q10. List all incomplete rides along with the reasons.
SELECT * FROM IncompleteRideReasons;
