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
-- A1 There were 25,207 successful bookings in the month of July
SELECT * FROM Successful_Bookings;


-- Q2 Find the average ride distance for each vehicle type?
CREATE VIEW AvgRideDistance_ByVehicleType AS
SELECT AVG(Ride_Distance) as AvgRideDistance, Vehicle_Type
FROM Portfolio..Dataset
WHERE Vehicle_Type is not null
GROUP BY Vehicle_Type;
-- A2 
SELECT * FROM AvgRideDistance_ByVehicleType;

-- Q3 Get the total number of cancelled rides by customers?
CREATE VIEW RidesCancelledByCustomers AS
SELECT Booking_Status, COUNT(Canceled_Rides_by_Customer) as RidesCancelledByCustomers
FROM Portfolio..Dataset
WHERE Booking_Status = 'Canceled by Customer'
GROUP BY Booking_Status;
-- A3 The total number of cancelled rides by customers is 4079
SELECT * FROM RidesCancelledByCustomers;

-- Q4  List the top 5 customers who booked the highest number of rides?
CREATE VIEW Top5Customers AS
SELECT TOP(5) Customer_ID, COUNT(Booking_ID) as TotalRide
FROM Portfolio..Dataset
GROUP BY Customer_ID
ORDER BY TotalRide DESC;
-- A4 Top 5 Customers are:
Select * FROM Top5Customers;

-- Q5 Get the number of rides cancelled by drivers due to personal and car-related issues?
CREATE VIEW RideCancelledByDriverDueToPersonalReason AS
SELECT COUNT(*) as RidesCancelledByDriver
FROM Portfolio..Dataset
WHERE Canceled_Rides_by_Driver like ('%Personal%');
-- A5 The total  number of rides cancelled by drivers due to personal and car-related issues are 2500
SELECT *FROM RideCancelledByDriverDueToPersonalReason;

-- Q6 Find the maximum and minimum driver ratings for Prime Sedan bookings?
CREATE VIEW MaxMinRatingSedan AS
SELECT MIN(Driver_Ratings) AS MinRating, MAX(Driver_Ratings) AS MaxRating, Vehicle_Type
FROM Portfolio..Dataset
WHERE Vehicle_Type = 'Prime Sedan'
GROUP BY Vehicle_Type;
-- A6 The  maximum and minimum driver ratings for Prime Sedan bookings are 3.0 and 5.0
SELECT * FROM MaxMinRatingSedan;

-- Q7 Retrieve all rides where payment was made using UPI?
CREATE VIEW PaymentsByUPI AS
SELECT * 
FROM Portfolio..Dataset
WHERE Payment_Method = 'UPI';
-- A7 The total number of rides where payment was made using UPI were 10,289
SELECT * FROM PaymentsByUPI;

-- Q8 Find the average customer rating per vehicle type
CREATE VIEW AvgCustomerRatingPerVehicleType AS
SELECT TOP(10) AVG(Customer_Rating) as AvgCustomerRating, Vehicle_Type
FROM Portfolio..Dataset
WHERE Vehicle_Type is not null
GROUP BY Vehicle_Type
ORDER BY AvgCustomerRating DESC;
-- A8 Avg Customer Rating Per Vehicle Type are as follows
SELECT * FROM AvgCustomerRatingPerVehicleType;

-- Q9 Calculate the total booking value of rides completed successfully
CREATE VIEW TotalBookingValueRideSuccessful AS
SELECT SUM(Booking_Value) as TotalValue
FROM Portfolio..Dataset
WHERE Booking_Status = 'Success';
-- A9 The total booking value of rides completed successfully was 1,37,62,477
SELECT * FROM TotalBookingValueRideSuccessful;

-- Q10 List all incomplete rides along with the reasons.
CREATE VIEW IncompleteRideReasons AS
SELECT Booking_ID, Incomplete_Rides_Reason
FROM Portfolio..Dataset
WHERE Incomplete_Rides = 'Yes';
-- A10 All the incomplete rides with reasons are
SELECT * FROM IncompleteRideReasons;