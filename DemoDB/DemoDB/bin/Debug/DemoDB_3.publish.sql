/*
Script de déploiement pour DemoDB

Ce code a été généré par un outil.
La modification de ce fichier peut provoquer un comportement incorrect et sera perdue si
le code est régénéré.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "DemoDB"
:setvar DefaultFilePrefix "DemoDB"
:setvar DefaultDataPath "C:\Users\renau\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"
:setvar DefaultLogPath "C:\Users\renau\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"

GO
:on error exit
GO
/*
Détectez le mode SQLCMD et désactivez l'exécution du script si le mode SQLCMD n'est pas pris en charge.
Pour réactiver le script une fois le mode SQLCMD activé, exécutez ce qui suit :
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'Le mode SQLCMD doit être activé de manière à pouvoir exécuter ce script.';
        SET NOEXEC ON;
    END


GO
USE [master];


GO

IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Création de la base de données $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)]
    ON 
    PRIMARY(NAME = [$(DatabaseName)], FILENAME = N'$(DefaultDataPath)$(DefaultFilePrefix)_Primary.mdf')
    LOG ON (NAME = [$(DatabaseName)_log], FILENAME = N'$(DefaultLogPath)$(DefaultFilePrefix)_Primary.ldf') COLLATE SQL_Latin1_General_CP1_CI_AS
GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CLOSE OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_UPDATE_STATISTICS_ASYNC OFF,
                PAGE_VERIFY NONE,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE,
                SUPPLEMENTAL_LOGGING OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'Impossible de modifier les paramètres de base de données. Vous devez être administrateur système pour appliquer ces paramètres.';
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET HONOR_BROKER_PRIORITY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'Impossible de modifier les paramètres de base de données. Vous devez être administrateur système pour appliquer ces paramètres.';
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET FILESTREAM(NON_TRANSACTED_ACCESS = OFF),
                CONTAINMENT = NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF),
                MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = OFF,
                DELAYED_DURABILITY = DISABLED 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_PLANS_PER_QUERY = 200, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), MAX_STORAGE_SIZE_MB = 100) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE = OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
    END


GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


GO
PRINT N'Création de Table [dbo].[Game]...';


GO
CREATE TABLE [dbo].[Game] (
    [Id]         INT            IDENTITY (1, 1) NOT NULL,
    [Name]       NVARCHAR (50)  NOT NULL,
    [Owner]      NVARCHAR (50)  NOT NULL,
    [Console]    NVARCHAR (50)  NOT NULL,
    [Price]      INT            NOT NULL,
    [MaxPlayers] INT            NOT NULL,
    [Commentary] NVARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Création de Table [dbo].[Movie]...';


GO
CREATE TABLE [dbo].[Movie] (
    [Id]          INT           IDENTITY (1, 1) NOT NULL,
    [Title]       NVARCHAR (50) NOT NULL,
    [Director]    NVARCHAR (50) NOT NULL,
    [ReleaseDate] DATE          NOT NULL,
    [Budget]      INT           NOT NULL,
    [ActorMain]   NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_Movie] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Création de Table [dbo].[Student]...';


GO
CREATE TABLE [dbo].[Student] (
    [Id]        INT           IDENTITY (1, 1) NOT NULL,
    [FirstName] NVARCHAR (50) NOT NULL,
    [LastName]  NVARCHAR (50) NOT NULL,
    [Birthdate] DATE          NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Création de Table [dbo].[User]...';


GO
CREATE TABLE [dbo].[User] (
    [Id]        INT            IDENTITY (1, 1) NOT NULL,
    [LastName]  NVARCHAR (50)  NOT NULL,
    [FirstName] NVARCHAR (256) NOT NULL,
    [Email]     NVARCHAR (50)  NOT NULL,
    [Password]  BINARY (64)    NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Création de Fonction [dbo].[CSF_GetPostSalt]...';


GO
CREATE FUNCTION [dbo].[CSF_GetPostSalt]
(
)
RETURNS NVARCHAR(2048)
AS
BEGIN
	RETURN N'8MVU77?r5#FuRhuNMuxd@-n?k7W%$23@PHE7wj?yFw53eX_#FcdMQ2ST9bB97&!&VughWq@axeApnN#Ee?gCd#58Cb%TV#hLC$Gp97ABSf4K4F8qnFT4DTLG4G-$xS_Vgk4GRS26v@85SRyNa9SMt3Jg@5yhVN74xy_d$z!nrt@3s5s2Yb3b@2Z5JM33anxG4ADfsFgR#H44x-HaL8bmwT2$2h?FGz6H3@-mm-M^d^d!rADvZ4mZzGcdn&VR24fhhNhq@RSMqfWjGbjXj6F2P!HjWfc4!XkLA@N=pUZTMtqxse?M^SYt*8$m2x$URq?gKY=2_m8D3pTCf^q4c?B&bTjE@BmHBqVM=MJzgk@@QkxfKbVJczf=9Q=vR!v^saTyRHyBhyh9FswmsM2br_dV3*U=zNZF+a-WLyUug*-!MKXb@zf^U$yz&L7Kx%3^pvtm%SVDnZdBhpfCpjvQE+&2jMnKG+DWeU!6ypu+6LyxqjrVkFSFJ7smb9CseSDS+c#wK6h5VGub3UJAQBrj6!Mn*MTcyr*#xnjyDcvtbRhm84#$V@jbtnR2+U^W@6JF$62J?LRU+6u__m#X8R9@v?W3P=vAYnjt%dw6FFu$CWT_N+5Lt@&-K&stH-MaqZ6upXv4ApzbQ%bZ^-km^Tum-$N=NWuvSg3T6FuF4xS%ub&?PaXz7dK7jVws7H-GX$r&qNqfvHg?u4zrY4qe%hmj3$zJMD%#r_K+f6*!%=ey?9V@p^7^?KYB3uRLZMDYgQR=Zevd5f@YWc^F@F*jwJ8CbC$sUx-?p?x+a^s2Us987JQFA2P_rgD%vFeSAcLejm3qPw7F9w-B^QMdVrtGc+kx+BUQXfg2zcd9A%pFr_MHtVcUVhBAU!NP4rbg_HwP7pUfZ+=J3XvXB!-xCk3L2RN3*Em6jx@zy%d%v+kEbDyAtPSX%C^^Fk6c^+C_hwNT=Ac4$2?z2*uYhtxD@53s9+J4fvSsuUreEAPkQ27KyMgbBetyQZv4t&UHFCG!tz3zQzR3kT=Wmtw4%L3yk#T!LeL?+92KL6uBE45vCYD+wUf2ec=AKsaDv8Nu2u=7W*wACF96xk!!QP$KNTLLT^-y4wHJ&g=x?$C3mCyM+UGp$Q&z_h?+9jWu3!qsAuzb@6wQPzZ@&?spzAnDckj72znUSzXH*Sgqf?ryzcxZLUXZLufSvAX2tx+HEVkSvwCJ?^k5_AwgV7HMWFvmC&3cgZET8-8&kp2y?cLqd%=*=cu=x4ZBhfE6XfnD*kTFNtwjcPepwT#tzP$Ge@-ds!m%*2pUgM$ezwhA%6p!_rT$mXQzBTu7*GKYSaahb!YMsEDhgyQk+6sr7Q!wdk42H*=^LwKh+qZqXda7&QHxrYPcmNS-ucZTKRzzk&xtgq@CAqgxU^Q%*NA_+JwbKAFJ7mE724w$6e&Z&cLbT59Dk2VQh644v*S4#$HenT?P%YfHVVWc!MK%C6qEBNpAC3^BDmjLHVcyx%6BrTCENLEDXkt4*wFKQt@4SYQ7ajxcG8T2%$Az6==bf4XJ2aUj=tGQdTNZUNqzfbt9$G&+=qS@X^GESHLYj7r269tCUx_y&q?eKd$sXU=9-*E%aJTXfpeB3BGy2pEM!VwTfZUmk#L4CC!Nb2*sWk*8Gem^Lg6qc6K6PR@qYU=W76y4D$rDTgAEzfAq&@_P!_vWbwrkth+teCASzx^8chsUu!qMqS^79Wc%#Y@zB5sB#U#qtNR3^Pdk=5vB^Z_XdeqTJVm%fUnU#TUv?cYPx4VbY3#WQKcRbxDFvVAWV_+8K#LrrMw#n8VgXchV_Y9BX=YJ#nD57#W3eSY@s&48upU*eBUJm+6C+Wx=Ed!PN!56E4jm=gB2b=!E!%=LkJc#=QPSRBUkyYAXP-RQhx%rM8XzEp%ThzeKGgJ^2Y$ecMuSx?#FNp+aLQ$#NCscCS_pt$Qj+Fs2-QL&_2%$duhY9NMjs97hX8aHj=Vn5Y%8sdBkxKT3pE!HY9CE6xyd=#vBB2a_4TL7TLD3yG-R3FYQX3GPYzjh%C4h-af*NvJuDffGuenkdVY^';
END
GO
PRINT N'Création de Fonction [dbo].[CSF_GetPreSalt]...';


GO
CREATE FUNCTION [dbo].[CSF_GetPreSalt]
(
)
RETURNS NVARCHAR(2048)
AS
BEGIN
	RETURN N'kmRYA%ux*y322RzMd_dC#j@8ZsE_RZFRqBNjLuR&^yV8dg4R_NRDH_?9VrAUWNm&e2e*qJUT5-+ph4t%F2RSj+nnFG4#MLJA3N%Kjgr+vHdy+kYJP-nvr9Qf+4A7S_Zm#%=VT2FS*#B=wFcTL$c%3puT8Tzw!jk84V26rswN?62mEt+Fr$TqA6H=NnwJm6j3V_h-zmxKzVvAej?5QKB7cE*ckPpZh3m29yFz*C*-^6ZHUvHjz8ymuDb7x-#&a#bYe!MdV5mRty6+9BSe_Fc%cJFtBbX!R*JPW+Pvr*xcC-8dFvjv$9NxQG$gewCtFgF4s*pBQfjmr#zmf@^j+8dwwdGg4pVvze=jR?rD9nh%*HL9*9pxQJcW^gbQSuBYs!KXYq2kZ&$JW$#VFeC%pfY_9hxnpHJEj?ABd#5mpn+fu7h3bkRA5n_EzVRYFB483%fP^GkwA&?AP8PkB=ytFSf%Q8KsM*3hXk3Q$5aG7mZJyRLZk+eH6WWnJS$7vu2&+z3q4KqSJMrDLE5*#?4bzCZT7jB-j^pZfNL=4uyTG2&mX@P7q+KZrmrVPFRGg4Q5G&2rE!z6LQReEVBRLvDqD6%7D?WwQL3cAf5qDJXZA9%?MFWwmsEemaXw!YkSwsnQ2kz3KyP8tvAgzCWhzH%=e@wKn?383gNua4gYAsaSPswG92tUx?%u!d!tHEmQxpmpvtBTH@_buQ4GVGG7vLngwD7d6C^8-pSVSzM^Y6mz3LKL!Vy@YsEpM*3LF+9MuEg8Lhfn!=d9Wr&4_CkS+Bum&ELUemYFC=rhNZuzh^PEA6A=-vZ&s5sD_eJhgTQ9QYVZ3?6*7#9%pB6?Dn*5q76jfwJ&d+ZQmsN@_3AyWSUP-NLw$D=9bB7UxPBYN9&DrU72D*TLPH-z8N3%kGmeyDfEbk9Q%+^Mku*BdNXny73_rRXcNU%W=MEV8GxjAkkUY&TAdBQPk?#fBV+XN2na*^Qr=rkS+p=XUfSwdS+WgKkvMs+vYt+YhamrkRtYMkT3yVQsH$eXm#J$6a#%kW@!VthZPQJ@sq#@Xs9v!5LGfe=x3z4@&Zt2kpy-_Gt+Hd=-LRNKEw%%B&BcL_yWC^q*juZR3hfKCQzxa8^uEZ^MZen3u7t^ZFaDYAD8kTfuEwLjV+R!=-Q9jjFMm!d%W#HJmN*WFFL#-!sgr$w&S_V6yJ$nt4e3euKtHcL?5Wq6sm+!gz@tASSE!5FMzAP9bvu4nV7&g56#TFZeLkY9s#AW_3EG8#bGb9bDj&c9%r$F?fK3yf6Szq-N!8!wy6qAX?CNXUTurePNE#pFxBGa^x+L9x66k+D-*qCYk&9NaaVLF%+Pd%8Z*d$as!B4aP@dT*U+HQ9&NMbq4B$@jKzNbgaH=G^E@Pq4JZYr5yr?7j9Azxzg+qaHabt$Ny43npbUXk$Dnrx4C-8y&BsWJEeSHKk#uy-f6xpVMq*hJqH*T!P229y?dXj-t8T#x?#C*cYpS-8uvKvb&VQeun_CV5#Ve3B@agfspWznL-wNMy95yj9MUmmrd&UB*Qrp4cfy*LhnFeUsN8sHh8ahgkPR%ATG%f%umYX!$4j3SAYmJG32%gAKZP3m@5xa5n*Xq=#X*QMnJ!=ux?SAfT%n@eUgJ3y$^vhn@fB@AYr&!fZGJqFkEa#YpW_FGv8tz4%%cxgF=fcWB4jheGj6shee3VfqdPXX*$5v#Uv*w3PNJXq9L*GYkj!PKfk9=_8-@Xn%h+c*Au=x9h8KhQZJ?PjxFCA-hjpLMHJggUwp96DW57M*NZstNAZYy^=D7byZpHjLuXNu%Q!WCwzJdeWuBB*@fBq=MFsbPB!6V2Kn?Bjh_Crn*GWz%ef6h_eQZEV-KR-kFJhe$Zqs3Q8KN9Jb-r&$8u*yPWv#VkQE#hpK3ECsWhh?YHmHqF%u!3Ys%pG%uWzBHJa8g5WLqzsAeKCf6LKmvCz%@wGT6+C*Ma-QY$KXQ2%2F-yuTuC@Ujbv8^jn69tYq5hQ?^yZp532M36LRcJ!EWT8T*Z7TE_YGed@-BFzX-xh3p?$Bkwn2xYn$^y8Lah8';
END
GO
PRINT N'Création de Procédure [dbo].[UserAuthentification]...';


GO
CREATE PROCEDURE [dbo].[UserAuthentification]
	@Email NVARCHAR(384),
	@Password NVARCHAR(20)
AS
Begin
	SELECT [Id], [LastName], [FirstName], [Email] FROM [User] Where [Email] = @Email And [Password] = HASHBYTES('SHA2_512', [dbo].[CSF_GetPreSalt]() + @Password + [dbo].[CSF_GetPostSalt]());
	RETURN 0
End
GO
PRINT N'Création de Procédure [dbo].[UserRegister]...';


GO
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
GO
EXEC [UserRegister] @lastName = 'Brigode', @firstName = 'Renaud', @email = 'renaud.brigode@mail.com', @password = 'test1234=';

INSERT INTO [Game] ([Name], [Owner], Console, Price, MaxPlayers, Commentary) VALUES
('Super Mario Bros', 'Florent', 'NES', 4, 1, 'Un jeu d''anthologie !'),
('Sonic', 'Patrick', 'Megadrive', 2, 1, 'Pour moi, le meilleur jeu du monde !'),
('Zelda : ocarina of time', 'Florent', 'Nintendo 64', 15, 1, 'Un jeu grand, beau et complet comme on en voit rarement de nos jours'),
('Mario Kart 64', 'Florent', 'Nintendo 64', 25, 4, 'Un excellent jeu de kart !'),
('Super Smash Bros Melee', 'Michel', 'GameCube', 55, 4, 'Un jeu de baston délirant !'),
('Dead or Alive', 'Patrick', 'Xbox', 60, 4, 'Le plus beau jeu de baston jamais créé'),
('Dead or Alive Xtreme Beach Volley Ball', 'Patrick', 'Xbox', 60, 4, 'Un jeu de beach volley de toute beauté o_O'),
('Enter the Matrix', 'Michel', 'PC', 45, 1, 'Plutôt bof comme jeu, mais ça complète bien le film'),
('Max Payne 2', 'Michel', 'PC', 50, 1, 'Très réaliste, une sorte de film noir sur fond d''histoire d''amour. A essayer !'),
('Yoshi''s Island', 'Florent', 'SuperNES', 6, 1, 'Le paradis des Yoshis :o)'),
('Commandos 3', 'Florent', 'PC', 44, 12, 'Un bon jeu d''action où on dirige un commando pendant la 2ème guerre mondiale !'),
('Final Fantasy X', 'Patrick', 'PS2', 40, 1, 'Encore un Final Fantasy mais celui la est encore plus beau !'),
('Pokemon Rubis', 'Florent', 'GBA', 44, 4, 'Pika-Pika-chu !!!'),
('Starcraft', 'Michel', 'PC', 19, 8, 'Le meilleur jeux pc de tout les temps !'),
('Grand Theft Auto 3', 'Michel', 'PS2', 30, 1, 'Comme dans les autres Gta on ecrase tout le monde :) .'),
('Homeworld 2', 'Michel', 'PC', 45, 6, 'Superbe ! o_O'),
('Aladin', 'Patrick', 'SuperNES', 10, 1, 'Comme le dessin Animé !'),
('Super Mario Bros 3', 'Michel', 'SuperNES', 10, 2, 'Le meilleur Mario selon moi.'),
('SSX 3', 'Florent', 'Xbox', 56, 2, 'Un très bon jeu de snow !'),
('Star Wars : Jedi outcast', 'Patrick', 'Xbox', 33, 1, 'Encore un jeu sur star-wars où on se prend pour Luke Skywalker !'),
('Actua Soccer 3', 'Patrick', 'PS', 30, 2, 'Un jeu de foot assez bof ...'),
('Time Crisis 3', 'Florent', 'PS2', 40, 1, 'Un troisième volet efficace mais pas vraiment surprenant'),
('X-FILES', 'Patrick', 'PS', 25, 1, 'Un jeu censé ressembler a la série mais assez raté ...'),
('Soul Calibur 2', 'Patrick', 'Xbox', 54, 1, 'Un jeu bien axé sur le combat'),
('Diablo', 'Florent', 'PS', 20, 1, 'Comme sur PC mais la c''est sur un ecran de télé :) !'),
('Street Fighter 2', 'Patrick', 'Megadrive', 10, 2, 'Le célèbre jeu de combat !'),
('Gundam Battle Assault 2', 'Florent', 'PS', 29, 1, 'Jeu japonais dont le gameplay est un peu limité. Peu de robots malheureusement'),
('Spider-Man', 'Florent', 'Megadrive', 15, 1, 'Vivez l''aventure de l''homme araignée'),
('Midtown Madness 3', 'Michel', 'Xbox', 59, 6, 'Dans la suite des autres versions de Midtown Madness'),
('Tetris', 'Florent', 'Gameboy', 5, 1, 'Qui ne connait pas ? '),
('The Rocketeer', 'Michel', 'NES', 2, 1, 'Un super un film et un jeu de m*rde ...'),
('Pro Evolution Soccer 3', 'Patrick', 'PS2', 59, 2, 'Un petit jeu de foot sur PS2'),
('Ice Hockey', 'Michel', 'NES', 7, 2, 'Jamais joué mais a mon avis ca parle de hockey sur glace ... =)'),
('Sydney 2000', 'Florent', 'Dreamcast', 15, 2, 'Les JO de Sydney dans votre salon !'),
('NBA 2k', 'Patrick', 'Dreamcast', 12, 2, 'A votre avis :p ?'),
('Aliens Versus Predator : Extinction', 'Michel', 'PS2', 20, 2, 'Un shoot''em up pour pc'),
('Crazy Taxi', 'Florent', 'Dreamcast', 11, 1, 'Conduite de taxi en folie !'),
('Le Maillon Faible', 'Mathieu', 'PS2', 10, 1, 'Le jeu de l''émission'),
('FIFA 64', 'Michel', 'Nintendo 64', 25, 2, 'Le premier jeu de foot sur la N64 =) !'),
('Qui Veut Gagner Des Millions', 'Florent', 'PS2', 10, 1, 'Le jeu de l''émission'),
('Monopoly', 'Sebastien', 'Nintendo 64', 21, 4, 'Bheuuu le monopoly sur N64 !'),
('Taxi 3', 'Corentin', 'PS2', 19, 4, 'Un jeu de voiture sur le film'),
('Indiana Jones Et Le Tombeau De L''Empereur', 'Florent', 'PS2', 25, 1, 'Notre aventurier préféré est de retour !!!'),
('F-ZERO', 'Mathieu', 'GBA', 25, 4, 'Un super jeu de course futuriste !'),
('Harry Potter Et La Chambre Des Secrets', 'Mathieu', 'Xbox', 30, 1, 'Abracadabra !! Le célebre magicien est de retour !'),
('Half-Life', 'Corentin', 'PC', 15, 32, 'L''autre meilleur jeu de tout les temps (surtout ses mods).'),
('Myst III Exile', 'Sébastien', 'Xbox', 49, 1, 'Un jeu de réflexion'),
('Wario World', 'Sebastien', 'Gamecube', 40, 4, 'Wario vs Mario ! Qui gagnera ! ?'),
('Rollercoaster Tycoon', 'Florent', 'Xbox', 29, 1, 'Jeu de gestion d''un parc d''attraction'),
('Splinter Cell', 'Patrick', 'Xbox', 53, 1, 'Jeu magnifique !');

INSERT INTO Movie (Title, Director, ReleaseDate, Budget, ActorMain) VALUES
('Le gendarme se marie!', 'Emile Gontrand','1987-09-17', 180000, 'Louis De Funès'),
('Avengers', 'Gérard Bouchard','1969-04-28', 1300000, 'De Niro'),
('Léon', 'Luc Besson','1999-10-03', 250000, 'Jean Reno'),
('Le 5ème élement', 'Luc Besson','2001-09-17', 830000, 'Mila Jovovitch'),
('Une histoire vraie', 'Emile Gontrand','1987-09-17', 450000, 'Lain Caunu');
GO

GO
DECLARE @VarDecimalSupported AS BIT;

SELECT @VarDecimalSupported = 0;

IF ((ServerProperty(N'EngineEdition') = 3)
    AND (((@@microsoftversion / power(2, 24) = 9)
          AND (@@microsoftversion & 0xffff >= 3024))
         OR ((@@microsoftversion / power(2, 24) = 10)
             AND (@@microsoftversion & 0xffff >= 1600))))
    SELECT @VarDecimalSupported = 1;

IF (@VarDecimalSupported > 0)
    BEGIN
        EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
    END


GO
PRINT N'Mise à jour terminée.';


GO
