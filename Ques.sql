CREATE TABLE [dbo].[Ques]
(
	[ID] INT NOT NULL PRIMARY KEY, 
    [Question] NCHAR(100) NOT NULL
	Foreign Key (ID) references UserData(ID)
);
