
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 09/26/2012 16:09:41
-- Generated from EDMX file: D:\Documents\Visual Studio 2010\Projects\RallyPortal\RallyPortal\Model.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [RallyPortal];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_ArticleComment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CommentSet] DROP CONSTRAINT [FK_ArticleComment];
GO
IF OBJECT_ID(N'[dbo].[FK_GalleryImage]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ImageSet] DROP CONSTRAINT [FK_GalleryImage];
GO
IF OBJECT_ID(N'[dbo].[FK_Highlights_inherits_Article]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ArticleSet_Highlights] DROP CONSTRAINT [FK_Highlights_inherits_Article];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[ArticleSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ArticleSet];
GO
IF OBJECT_ID(N'[dbo].[CommentSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CommentSet];
GO
IF OBJECT_ID(N'[dbo].[TeamSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TeamSet];
GO
IF OBJECT_ID(N'[dbo].[ImageSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ImageSet];
GO
IF OBJECT_ID(N'[dbo].[GallerySet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[GallerySet];
GO
IF OBJECT_ID(N'[dbo].[ArticleSet_Highlights]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ArticleSet_Highlights];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'ArticleSet'
CREATE TABLE [dbo].[ArticleSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Title] nvarchar(max)  NOT NULL,
    [Content] nvarchar(max)  NOT NULL,
    [PublishedDate] datetime  NOT NULL,
    [LastModifiedDate] datetime  NOT NULL,
    [Published] bit  NOT NULL,
    [ImageUrl] nvarchar(max)  NOT NULL,
    [Author] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'CommentSet'
CREATE TABLE [dbo].[CommentSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Content] nvarchar(max)  NOT NULL,
    [PostDate] datetime  NOT NULL,
    [AuthorName] nvarchar(max)  NOT NULL,
    [AuthorEmail] nvarchar(max)  NOT NULL,
    [Article_Id] int  NOT NULL
);
GO

-- Creating table 'TeamSet'
CREATE TABLE [dbo].[TeamSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [TeamName] nvarchar(max)  NOT NULL,
    [DriverName] nvarchar(max)  NOT NULL,
    [CoDriverName] nvarchar(max)  NOT NULL,
    [TeamImageUrl] nvarchar(max)  NOT NULL,
    [DriverImageUrl] nvarchar(max)  NOT NULL,
    [CoDriverImageUrl] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'ImageSet'
CREATE TABLE [dbo].[ImageSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Title] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [ImageUrl] nvarchar(max)  NOT NULL,
    [GalleryId] int  NOT NULL
);
GO

-- Creating table 'GallerySet'
CREATE TABLE [dbo].[GallerySet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Published] bit  NOT NULL,
    [Title] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'ArticleSet_Highlights'
CREATE TABLE [dbo].[ArticleSet_Highlights] (
    [VideoUrl] nvarchar(max)  NOT NULL,
    [Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'ArticleSet'
ALTER TABLE [dbo].[ArticleSet]
ADD CONSTRAINT [PK_ArticleSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'CommentSet'
ALTER TABLE [dbo].[CommentSet]
ADD CONSTRAINT [PK_CommentSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'TeamSet'
ALTER TABLE [dbo].[TeamSet]
ADD CONSTRAINT [PK_TeamSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ImageSet'
ALTER TABLE [dbo].[ImageSet]
ADD CONSTRAINT [PK_ImageSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'GallerySet'
ALTER TABLE [dbo].[GallerySet]
ADD CONSTRAINT [PK_GallerySet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ArticleSet_Highlights'
ALTER TABLE [dbo].[ArticleSet_Highlights]
ADD CONSTRAINT [PK_ArticleSet_Highlights]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Article_Id] in table 'CommentSet'
ALTER TABLE [dbo].[CommentSet]
ADD CONSTRAINT [FK_ArticleComment]
    FOREIGN KEY ([Article_Id])
    REFERENCES [dbo].[ArticleSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ArticleComment'
CREATE INDEX [IX_FK_ArticleComment]
ON [dbo].[CommentSet]
    ([Article_Id]);
GO

-- Creating foreign key on [GalleryId] in table 'ImageSet'
ALTER TABLE [dbo].[ImageSet]
ADD CONSTRAINT [FK_GalleryImage]
    FOREIGN KEY ([GalleryId])
    REFERENCES [dbo].[GallerySet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_GalleryImage'
CREATE INDEX [IX_FK_GalleryImage]
ON [dbo].[ImageSet]
    ([GalleryId]);
GO

-- Creating foreign key on [Id] in table 'ArticleSet_Highlights'
ALTER TABLE [dbo].[ArticleSet_Highlights]
ADD CONSTRAINT [FK_Highlights_inherits_Article]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[ArticleSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------