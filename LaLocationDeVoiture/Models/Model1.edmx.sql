
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 01/09/2022 02:39:16
-- Generated from EDMX file: C:\Users\acer\source\repos\LaLocationDeVoiture\LaLocationDeVoiture\Models\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [LaLocationDeVoiture];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Reservation]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Reservation];
GO
IF OBJECT_ID(N'[dbo].[User]', 'U') IS NOT NULL
    DROP TABLE [dbo].[User];
GO
IF OBJECT_ID(N'[dbo].[Voiture]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Voiture];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Reservation'
CREATE TABLE [dbo].[Reservation] (
    [id_reservation] int IDENTITY(1,1) NOT NULL,
    [matricule] varchar(50)  NULL,
    [cin] varchar(50)  NULL,
    [date_deb] datetime  NULL,
    [nbr_jour] int  NULL,
    [lieu_deb] varchar(50)  NULL,
    [lieu_fin] varchar(50)  NULL,
    [montant] float  NULL
);
GO

-- Creating table 'User'
CREATE TABLE [dbo].[User] (
    [id_user] int IDENTITY(1,1) NOT NULL,
    [cin] varchar(50)  NULL,
    [user_name] varchar(50)  NULL,
    [nom] varchar(50)  NULL,
    [prenom] varchar(50)  NULL,
    [tel] varchar(50)  NULL,
    [num_permis] varchar(50)  NULL,
    [email] varchar(50)  NULL,
    [mot_pass] varchar(50)  NULL,
    [role] int  NULL
);
GO

-- Creating table 'Voiture'
CREATE TABLE [dbo].[Voiture] (
    [id_voiture] int IDENTITY(1,1) NOT NULL,
    [matricule] varchar(50)  NULL,
    [marque] varchar(50)  NULL,
    [modele] varchar(50)  NULL,
    [motorisation] varchar(50)  NULL,
    [prix] float  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------


-- Creating primary key on [id_reservation] in table 'Reservation'
ALTER TABLE [dbo].[Reservation]
ADD CONSTRAINT [PK_Reservation]
    PRIMARY KEY CLUSTERED ([id_reservation] ASC);
GO

-- Creating primary key on [id_user] in table 'User'
ALTER TABLE [dbo].[User]
ADD CONSTRAINT [PK_User]
    PRIMARY KEY CLUSTERED ([id_user] ASC);
GO

-- Creating primary key on [id_voiture] in table 'Voiture'
ALTER TABLE [dbo].[Voiture]
ADD CONSTRAINT [PK_Voiture]
    PRIMARY KEY CLUSTERED ([id_voiture] ASC);
GO

-- --------------------------------------------------
ALTER TABLE [dbo].[Voiture]
ADD [etat] varchar(50)  NULL;
GO

-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------