USE ChildCareSystem 
GO

CREATE TABLE tblRole(RoleID int	PRIMARY KEY, RoleName varchar(10))

CREATE TABLE tblIdentity(IdentityID int IDENTITY(10000,1) PRIMARY KEY NOT NULL, PhoneNumber varchar(20) not null, Password varchar(50) not null, 
				CreatedDate datetime default CURRENT_TIMESTAMP, UpdatedDate datetime ,
				RoleID int NOT NULL FOREIGN KEY REFERENCES tblRole(RoleID) on delete cascade on update cascade)

CREATE TABLE tblCustomer(CustomerID int IDENTITY(200000,1) PRIMARY KEY NOT NULL, 
			IdentityID int NOT NULL FOREIGN KEY REFERENCES tblIdentity(IdentityID) on delete cascade on update cascade,
				CreatedDate datetime default CURRENT_TIMESTAMP, UpdatedDate datetime ,
				FullName nvarchar(100), Email varchar(100), Address nvarchar(100), Birthday datetime, CitizenID varchar(12) )
				
CREATE TABLE tblSpecialty(SpecialtyID varchar(20) PRIMARY KEY NOT NULL,	SpecialtyName nvarchar(100))

CREATE TABLE tblStaff(StaffID int IDENTITY(900000,1) PRIMARY KEY NOT NULL, IdentityID int FOREIGN KEY REFERENCES tblIdentity(IdentityID),
				CreatedDate datetime default CURRENT_TIMESTAMP, UpdatedDate datetime ,
				FullName nvarchar(100), Email varchar(100), Address nvarchar(100), Birthday datetime, CitizenID varchar(12),
				SpecialtyID varchar(20) NOT NULL FOREIGN KEY REFERENCES tblSpecialty(SpecialtyID) on delete cascade on update cascade)