CREATE PROCEDURE [dbo].[UserAuthentification]
	@email NVARCHAR(384),
	@password NVARCHAR(20)
AS
Begin
	SELECT [Id], [LastName], [FirstName], [Email] FROM [User] Where [Email] = @email And [Password] = HASHBYTES('SHA2_512', [dbo].[CSF_GetPreSalt]() + @password + [dbo].[CSF_GetPostSalt]());
	RETURN 0
End
