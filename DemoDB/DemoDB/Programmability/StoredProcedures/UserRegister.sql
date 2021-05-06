CREATE PROCEDURE [dbo].[UserRegister]
	@lastName NVARCHAR(50),
	@firstName NVARCHAR(50),
	@email NVARCHAR(384),
	@password NVARCHAR(20)
AS
BEGIN
	INSERT INTO [User] ([LastName], [FirstName], [Email], [Password]) VALUES (@lastName, @firstName, @email, HASHBYTES('SHA2_512', [dbo].[CSF_GetPreSalt]() + @password + [dbo].[CSF_GetPostSalt]()));
	RETURN 0
END
