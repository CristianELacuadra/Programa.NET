
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 05/05/2016 16:36:42
-- Generated from EDMX file: D:\Documents\facultad\optativa plataforma de desarrolo.net\Trabajo Practico\TpFinal .net\PlataformaDeDesarrollo.net\CapaDatos\ModeloDatos.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [DBO.net];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Gerente'
CREATE TABLE [dbo].[Gerente] (
    [DNI] int  NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Apellido] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Proyecto'
CREATE TABLE [dbo].[Proyecto] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Descripcion] nvarchar(max)  NULL,
    [Fecha] datetime  NOT NULL,
    [GerenteID] int  NOT NULL
);
GO

-- Creating table 'Factor'
CREATE TABLE [dbo].[Factor] (
    [ID] int  NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Ponderacion_ID] int  NOT NULL
);
GO

-- Creating table 'Valor'
CREATE TABLE [dbo].[Valor] (
    [Denominacion] nvarchar(max)  NOT NULL,
    [NumValor] smallint  NOT NULL,
    [ID] int IDENTITY(1,1) NOT NULL,
    [FactorID] int  NOT NULL
);
GO

-- Creating table 'Ponderacion'
CREATE TABLE [dbo].[Ponderacion] (
    [Peso] nvarchar(max)  NOT NULL,
    [ID] int IDENTITY(1,1) NOT NULL
);
GO

-- Creating table 'Altera'
CREATE TABLE [dbo].[Altera] (
    [Gerente_DNI] int  NOT NULL,
    [Factor_ID] int  NOT NULL
);
GO

-- Creating table 'Caracteriza'
CREATE TABLE [dbo].[Caracteriza] (
    [Proyecto_ID] int  NOT NULL,
    [Factor_ID] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [DNI] in table 'Gerente'
ALTER TABLE [dbo].[Gerente]
ADD CONSTRAINT [PK_Gerente]
    PRIMARY KEY CLUSTERED ([DNI] ASC);
GO

-- Creating primary key on [ID] in table 'Proyecto'
ALTER TABLE [dbo].[Proyecto]
ADD CONSTRAINT [PK_Proyecto]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Factor'
ALTER TABLE [dbo].[Factor]
ADD CONSTRAINT [PK_Factor]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Valor'
ALTER TABLE [dbo].[Valor]
ADD CONSTRAINT [PK_Valor]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Ponderacion'
ALTER TABLE [dbo].[Ponderacion]
ADD CONSTRAINT [PK_Ponderacion]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [Gerente_DNI], [Factor_ID] in table 'Altera'
ALTER TABLE [dbo].[Altera]
ADD CONSTRAINT [PK_Altera]
    PRIMARY KEY CLUSTERED ([Gerente_DNI], [Factor_ID] ASC);
GO

-- Creating primary key on [Proyecto_ID], [Factor_ID] in table 'Caracteriza'
ALTER TABLE [dbo].[Caracteriza]
ADD CONSTRAINT [PK_Caracteriza]
    PRIMARY KEY CLUSTERED ([Proyecto_ID], [Factor_ID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [GerenteID] in table 'Proyecto'
ALTER TABLE [dbo].[Proyecto]
ADD CONSTRAINT [FK_Registra]
    FOREIGN KEY ([GerenteID])
    REFERENCES [dbo].[Gerente]
        ([DNI])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Registra'
CREATE INDEX [IX_FK_Registra]
ON [dbo].[Proyecto]
    ([GerenteID]);
GO

-- Creating foreign key on [Gerente_DNI] in table 'Altera'
ALTER TABLE [dbo].[Altera]
ADD CONSTRAINT [FK_Altera_Gerente]
    FOREIGN KEY ([Gerente_DNI])
    REFERENCES [dbo].[Gerente]
        ([DNI])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Factor_ID] in table 'Altera'
ALTER TABLE [dbo].[Altera]
ADD CONSTRAINT [FK_Altera_Factor]
    FOREIGN KEY ([Factor_ID])
    REFERENCES [dbo].[Factor]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Altera_Factor'
CREATE INDEX [IX_FK_Altera_Factor]
ON [dbo].[Altera]
    ([Factor_ID]);
GO

-- Creating foreign key on [Proyecto_ID] in table 'Caracteriza'
ALTER TABLE [dbo].[Caracteriza]
ADD CONSTRAINT [FK_Caracteriza_Proyecto]
    FOREIGN KEY ([Proyecto_ID])
    REFERENCES [dbo].[Proyecto]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Factor_ID] in table 'Caracteriza'
ALTER TABLE [dbo].[Caracteriza]
ADD CONSTRAINT [FK_Caracteriza_Factor]
    FOREIGN KEY ([Factor_ID])
    REFERENCES [dbo].[Factor]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Caracteriza_Factor'
CREATE INDEX [IX_FK_Caracteriza_Factor]
ON [dbo].[Caracteriza]
    ([Factor_ID]);
GO

-- Creating foreign key on [Ponderacion_ID] in table 'Factor'
ALTER TABLE [dbo].[Factor]
ADD CONSTRAINT [FK_Asigna]
    FOREIGN KEY ([Ponderacion_ID])
    REFERENCES [dbo].[Ponderacion]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Asigna'
CREATE INDEX [IX_FK_Asigna]
ON [dbo].[Factor]
    ([Ponderacion_ID]);
GO

-- Creating foreign key on [FactorID] in table 'Valor'
ALTER TABLE [dbo].[Valor]
ADD CONSTRAINT [FK_Tiene]
    FOREIGN KEY ([FactorID])
    REFERENCES [dbo].[Factor]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Tiene'
CREATE INDEX [IX_FK_Tiene]
ON [dbo].[Valor]
    ([FactorID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------