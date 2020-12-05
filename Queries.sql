Create Database Centauro

CREATE
 TABLE GPS_DATA(
[Id] [int] IDENTITY(1,1) NOT NULL,
[DateSystem] [datetime] NOT NULL,
[DateEvent] [datetime] NULL,
[Latitude] [float] NULL,
[Longitude] [float] NULL,
[Battery] [int] NULL,
[Source] [int] NULL,
[Type] [int] NULL)

Create procedure sp_GetGPS_DATA
	as
		begin
			Select Id,
				   DateSystem,
				   DateEvent,
				   Latitude,
				   Longitude,
				   Battery,
				   Source,
				   Type
			from GPS_DATA
		end


Create procedure sp_GetGPS_DATAById 
@Id int
	as
		begin
			Select Id,
				   DateSystem,
				   DateEvent,
				   Latitude,
				   Longitude,
				   Battery,
				   Source,
				   Type
			from GPS_DATA
			where Id=@Id
		end

Create procedure sp_AddGPS_DATA
@DateSystem datetime,
@DateEvent datetime,
@Latitude float,
@Longitude float,
@Battery int,
@Source int,
@Type int
			as
				begin
					insert into GPS_DATA
						   values(@DateSystem,
						          @DateEvent,
								  @Latitude,
								  @Longitude,
								  @Battery,
								  @Source,
								  @Type)
				end

Create procedure sp_UpdateGPS_DATA
@id int,
@DateSystem datetime,
@DateEvent datetime,
@Latitude float,
@Longitude float,
@Battery int,
@Source int,
@Type int
			as
				begin
					update GPS_DATA
						set DateSystem=@DateSystem,
							DateEvent=@DateEvent,
							Latitude=@Latitude,
							Longitude=@Longitude,
							Battery=@Battery,
							Source=@Source,
							Type=@Type
					where id=@id
				end

Create procedure sp_DeleteGPS_DATA
@id int
	as
		begin
			delete GPS_DATA
			where id=@id
		end

CREATE TABLE [dbo].[CTL_USERS](
[Id] [int] IDENTITY(1,1) NOT NULL,
[IdRole] [int] NULL,
[Name] [varchar](20) NULL,
[LastName] [varchar](25) NULL,
[SurName] [varchar](25) NULL,
[Email] [varchar](80) NOT NULL,
[UserName] [varchar](15) NOT NULL,
[Password] [varbinary](8000) NOT NULL,
[Parent] [int] NULL,
[Status] [int] NOT NULL
) ON [PRIMARY]

 CREATE TABLE [dbo].[CTL_ROLES](
[IdRole] [int] IDENTITY(1,1) NOT NULL,
[RoleName] varchar(20) NULL)
