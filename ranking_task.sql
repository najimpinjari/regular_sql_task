use ADODOTNET


-- Creating the first table: Room
CREATE TABLE Room (
    RoomID INT PRIMARY KEY,
    RoomName VARCHAR(50),
    RoomType VARCHAR(50)
);

-- Creating the second table: RoomPartners
CREATE TABLE RoomPartners (
    PartnerID INT PRIMARY KEY,
    PartnerName VARCHAR(50),
    RoomID INT,
    FOREIGN KEY (RoomID) REFERENCES Room(RoomID)
);

-- Inserting sample values into Room table
INSERT INTO Room (RoomID, RoomName, RoomType)
VALUES 
    (1, '101', 'Single'),
    (2, '201', 'Double'),
    (3, '301', 'Suite');

-- Inserting sample values into RoomPartners table
INSERT INTO RoomPartners (PartnerID, PartnerName, RoomID)
VALUES
    (101, 'John Doe', 1),
    (102, 'Jane Smith', 2),
    (103, 'Michael Johnson', 1),
    (104, 'Emily Brown', 3),
    (105, 'David Wilson', 1);


	--Retrieve all rooms along with their respective partners.

	select Room.* ,RoomPartners.*
	from Room 
	inner join RoomPartners
	on Room.RoomID = RoomPartners.RoomID


	--Get the details of partners staying in room '101'.
	
	select RoomPartners.PartnerName 
	from Room
	join RoomPartners
	on Room.RoomID = RoomPartners.RoomID
	where RoomPartners.RoomID = '101';

	--Count the number of partners staying in each room.
	
	select count(PartnerID) from RoomPartners
	group by RoomID

	SELECT r.RoomName, COUNT(rp.PartnerID) AS NumberOfPartners
FROM Room r
LEFT JOIN RoomPartners rp ON r.RoomID = rp.RoomID
GROUP BY r.RoomName;


