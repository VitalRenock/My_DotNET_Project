CREATE TABLE [dbo].[Movie]
(
	[Id] INT NOT NULL IDENTITY,
	[Title] NVARCHAR(50) NOT NULL,
	[Director] NVARCHAR(50) NOT NULL,
    [ReleaseDate] DATE NOT NULL, 
    [Budget] INT NOT NULL, 
    [ActorMain] NVARCHAR(50) NOT NULL,

    CONSTRAINT [PK_Movie] PRIMARY KEY ([Id]) 
)
