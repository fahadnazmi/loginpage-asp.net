CREATE TABLE [dbo].[UserData]
(
	[ID] INT NOT NULL PRIMARY KEY, 
    [Username] NCHAR(15) NOT NULL, 
    [Email] NCHAR(50) NOT NULL, 
    [Password] NCHAR(50) NOT NULL, 
    [SecQues] INT NOT NULL, 
    [Ans] NCHAR(100) NOT NULL
)
