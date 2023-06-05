CREATE DATABASE [TOS2Dev]
GO

USE [TOS2Dev]
GO
/****** Object:  User [tos-api]    Script Date: 6/5/2023 5:15:44 PM ******/
CREATE USER [tos-api] FOR LOGIN [tos-api] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [tos-api]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [tos-api]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [tos-api]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [tos-api]
GO
ALTER ROLE [db_datareader] ADD MEMBER [tos-api]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [tos-api]
GO
/****** Object:  FullTextCatalog [Companies]    Script Date: 6/5/2023 5:15:44 PM ******/
CREATE FULLTEXT CATALOG [Companies] WITH ACCENT_SENSITIVITY = ON
GO
/****** Object:  FullTextCatalog [Contacts]    Script Date: 6/5/2023 5:15:44 PM ******/
CREATE FULLTEXT CATALOG [Contacts] WITH ACCENT_SENSITIVITY = ON
GO
/****** Object:  FullTextCatalog [Exceptions]    Script Date: 6/5/2023 5:15:44 PM ******/
CREATE FULLTEXT CATALOG [Exceptions] WITH ACCENT_SENSITIVITY = ON
GO
/****** Object:  FullTextCatalog [Files]    Script Date: 6/5/2023 5:15:44 PM ******/
CREATE FULLTEXT CATALOG [Files] WITH ACCENT_SENSITIVITY = ON
GO
/****** Object:  FullTextCatalog [Orders]    Script Date: 6/5/2023 5:15:44 PM ******/
CREATE FULLTEXT CATALOG [Orders] WITH ACCENT_SENSITIVITY = ON
GO
/****** Object:  FullTextCatalog [Users]    Script Date: 6/5/2023 5:15:44 PM ******/
CREATE FULLTEXT CATALOG [Users] WITH ACCENT_SENSITIVITY = ON
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 6/5/2023 5:15:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[id] [uniqueidentifier] NOT NULL,
	[fileId] [uniqueidentifier] NULL,
	[orderId] [uniqueidentifier] NULL,
	[noteText] [varchar](500) NULL,
	[addedBy] [uniqueidentifier] NOT NULL,
	[mentions] [nvarchar](365) NOT NULL,
	[addedAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NOT NULL,
	[section] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Companies]    Script Date: 6/5/2023 5:15:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Companies](
	[id] [uniqueidentifier] NOT NULL,
	[companyName] [varchar](2250) NOT NULL,
	[address] [nvarchar](max) NOT NULL,
	[email] [nvarchar](2500) NOT NULL,
	[legalName] [varchar](2500) NULL,
	[phone] [nvarchar](max) NOT NULL,
	[abbreviation] [varchar](5) NOT NULL,
	[profile] [nvarchar](max) NOT NULL,
	[website] [varchar](250) NULL,
	[notes] [nvarchar](max) NOT NULL,
	[createdOn] [datetime] NOT NULL,
	[updatedAt] [datetime] NOT NULL,
	[organizationId] [uniqueidentifier] NOT NULL,
	[organizationName] [varchar](2250) NOT NULL,
	[defaultOffice] [int] NOT NULL,
 CONSTRAINT [PK_Companies] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 6/5/2023 5:15:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[id] [uniqueidentifier] NOT NULL,
	[firstName] [varchar](50) NOT NULL,
	[lastName] [varchar](50) NULL,
	[companyId] [uniqueidentifier] NULL,
	[address] [nvarchar](550) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[phone] [nvarchar](300) NOT NULL,
	[role] [varchar](50) NULL,
	[department] [varchar](50) NULL,
	[active] [bit] NOT NULL,
	[keyContact] [bit] NOT NULL,
	[profile] [nvarchar](max) NULL,
	[notes] [nvarchar](max) NULL,
	[createdBy] [uniqueidentifier] NOT NULL,
	[createdOn] [datetime] NOT NULL,
	[updatedAt] [datetime] NOT NULL,
	[organizationId] [uniqueidentifier] NULL,
 CONSTRAINT [Contacts_pk] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Counties]    Script Date: 6/5/2023 5:15:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Counties](
	[id] [uniqueidentifier] NOT NULL,
	[countyName] [varchar](50) NOT NULL,
	[countyAbbr] [varchar](2) NOT NULL,
	[taxPeriods] [int] NOT NULL,
	[dueDates] [nvarchar](250) NOT NULL,
 CONSTRAINT [Counties_pk] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dropdowns]    Script Date: 6/5/2023 5:15:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dropdowns](
	[name] [varchar](50) NOT NULL,
	[items] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exceptions]    Script Date: 6/5/2023 5:15:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exceptions](
	[id] [uniqueidentifier] NOT NULL,
	[exceptionCode] [varchar](10) NOT NULL,
	[category] [varchar](50) NULL,
	[reportText] [varchar](max) NULL,
	[description] [varchar](max) NULL,
	[codeKey] [int] NOT NULL,
	[status] [bit] NULL,
	[directorCategory] [varchar](50) NULL,
 CONSTRAINT [PK_Exceptions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Files]    Script Date: 6/5/2023 5:15:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Files](
	[id] [uniqueidentifier] NOT NULL,
	[fileName] [varchar](50) NOT NULL,
	[orderId] [uniqueidentifier] NULL,
	[customerId] [uniqueidentifier] NULL,
	[jobNumber] [varchar](150) NULL,
	[sellerName] [varchar](500) NULL,
	[county] [varchar](50) NULL,
	[insurer] [uniqueidentifier] NULL,
	[insuredAmount] [int] NULL,
	[client] [uniqueidentifier] NULL,
	[federalAidType] [varchar](5) NULL,
	[route] [varchar](150) NULL,
	[additional] [nvarchar](250) NOT NULL,
	[legalDescription] [nvarchar](max) NULL,
	[contiguous] [nvarchar](max) NULL,
	[taxes] [nvarchar](max) NULL,
	[conveyances] [nvarchar](max) NULL,
	[defendants] [nvarchar](max) NULL,
	[plaintiffs] [nvarchar](max) NULL,
	[namesSearched] [nvarchar](max) NULL,
	[contacts] [nvarchar](max) NULL,
	[notes] [nvarchar](max) NULL,
	[searcher] [nvarchar](500) NULL,
	[processor] [nvarchar](500) NULL,
	[examiner] [nvarchar](500) NULL,
	[instructions] [nvarchar](max) NULL,
	[createdBy] [uniqueidentifier] NOT NULL,
	[createdOn] [datetime] NOT NULL,
	[updatedBy] [uniqueidentifier] NOT NULL,
	[updatedAt] [datetime] NOT NULL,
	[section] [varchar](150) NULL,
	[LOB] [int] NULL,
	[status] [varchar](10) NOT NULL,
	[titleProduct] [varchar](150) NOT NULL,
	[letterDate] [datetime] NULL,
	[receivedDate] [datetime] NULL,
	[underwritingDate] [datetime] NULL,
	[TVI] [varchar](3000) NULL,
	[previousTVI] [varchar](3000) NULL,
	[landInfo] [nvarchar](max) NULL,
	[voidedDate] [datetime] NULL,
	[destroyed] [bit] NOT NULL,
	[destroyedDate] [datetime] NULL,
	[exceptions] [nvarchar](max) NULL,
	[taxExceptions] [nvarchar](max) NULL,
 CONSTRAINT [PK_Files] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 6/5/2023 5:15:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[id] [uniqueidentifier] NOT NULL,
	[imageName] [varchar](250) NOT NULL,
	[location] [varchar](350) NOT NULL,
	[createdOn] [datetime] NOT NULL,
	[updatedAt] [datetime] NOT NULL,
	[updatedBy] [uniqueidentifier] NOT NULL,
	[url] [varchar](100) NOT NULL,
 CONSTRAINT [Images_pk] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 6/5/2023 5:15:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[id] [uniqueidentifier] NOT NULL,
	[user] [uniqueidentifier] NULL,
	[type] [varchar](50) NOT NULL,
	[read] [bit] NOT NULL,
	[message] [varchar](250) NULL,
	[important] [bit] NOT NULL,
	[fileId] [uniqueidentifier] NULL,
	[orderId] [uniqueidentifier] NULL,
	[noteId] [uniqueidentifier] NULL,
	[createdBy] [varchar](50) NOT NULL,
	[createdOn] [datetime] NULL,
	[updatedAt] [datetime] NULL,
 CONSTRAINT [Notifications_pk] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 6/5/2023 5:15:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [uniqueidentifier] NOT NULL,
	[orderName] [varchar](25) NOT NULL,
	[taxPins] [nvarchar](max) NOT NULL,
	[jobNumber] [varchar](50) NULL,
	[parcelNumbers] [nvarchar](max) NULL,
	[federalAidType] [varchar](5) NULL,
	[route] [varchar](150) NULL,
	[requestedBy] [uniqueidentifier] NULL,
	[insured] [uniqueidentifier] NULL,
	[defaultTitleProduct] [varchar](100) NOT NULL,
	[defaultTitleProductPrice] [int] NOT NULL,
	[searcher] [nvarchar](500) NOT NULL,
	[examiner] [nvarchar](500) NOT NULL,
	[processor] [nvarchar](500) NOT NULL,
	[invoiceTo] [uniqueidentifier] NULL,
	[reportTo] [uniqueidentifier] NULL,
	[LOBType] [int] NULL,
	[WTGOrder] [int] NOT NULL,
	[fiscalYear] [int] NOT NULL,
	[county] [varchar](50) NULL,
	[section] [varchar](150) NULL,
	[customCustomerRef] [nvarchar](1000) NULL,
	[instructions] [nvarchar](max) NULL,
	[createdBy] [uniqueidentifier] NOT NULL,
	[createdOn] [datetime] NOT NULL,
	[updatedBy] [uniqueidentifier] NOT NULL,
	[updatedAt] [datetime] NOT NULL,
	[numberOfFiles] [int] NOT NULL,
	[notes] [nvarchar](max) NOT NULL,
	[status] [varchar](25) NOT NULL,
	[firstFile] [varchar](25) NULL,
	[letterDate] [datetime] NULL,
	[receivedDate] [datetime] NULL,
	[calendarDays] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/5/2023 5:15:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [uniqueidentifier] NOT NULL,
	[userName] [varchar](255) NULL,
	[firstName] [varchar](255) NOT NULL,
	[lastName] [varchar](255) NOT NULL,
	[profile] [nvarchar](500) NULL,
	[roles] [nvarchar](255) NOT NULL,
	[email] [varchar](255) NULL,
	[phone] [varchar](15) NULL,
	[phoneExtension] [varchar](10) NULL,
	[active] [bit] NOT NULL,
	[createdOn] [datetime] NULL,
	[updatedAt] [datetime] NULL,
	[quickLinks] [nvarchar](max) NOT NULL,
	[password] [varchar](250) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[uszips]    Script Date: 6/5/2023 5:15:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[uszips](
	[zip] [varchar](5) NULL,
	[lat] [varchar](20) NULL,
	[lng] [varchar](20) NULL,
	[city] [varchar](120) NULL,
	[state_id] [varchar](2) NULL,
	[state_name] [varchar](50) NULL,
	[zcta] [tinyint] NULL,
	[parent_zcta] [varchar](5) NULL,
	[population] [real] NULL,
	[density] [real] NULL,
	[county_fips] [varchar](5) NULL,
	[county_name] [varchar](45) NULL,
	[county_weights] [varchar](100) NULL,
	[county_names_all] [varchar](500) NULL,
	[county_fips_all] [varchar](100) NULL,
	[imprecise] [tinyint] NULL,
	[military] [tinyint] NULL,
	[timezone] [varchar](120) NULL,
	[age_median] [real] NULL,
	[male] [real] NULL,
	[female] [real] NULL,
	[married] [real] NULL,
	[family_size] [real] NULL,
	[income_household_median] [real] NULL,
	[income_household_six_figure] [real] NULL,
	[home_ownership] [real] NULL,
	[home_value] [real] NULL,
	[rent_median] [real] NULL,
	[education_college_or_above] [real] NULL,
	[labor_force_participation] [real] NULL,
	[unemployment_rate] [real] NULL,
	[race_white] [real] NULL,
	[race_black] [real] NULL,
	[race_asian] [real] NULL,
	[race_native] [real] NULL,
	[race_pacific] [real] NULL,
	[race_other] [real] NULL,
	[race_multiple] [real] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comments] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[Comments] ADD  DEFAULT ('[]') FOR [mentions]
GO
ALTER TABLE [dbo].[Comments] ADD  DEFAULT (getdate()) FOR [addedAt]
GO
ALTER TABLE [dbo].[Comments] ADD  DEFAULT (getdate()) FOR [updatedAt]
GO
ALTER TABLE [dbo].[Companies] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[Companies] ADD  DEFAULT ('[{"noteText": null, "addedBy": null, "addedAt": null}]') FOR [notes]
GO
ALTER TABLE [dbo].[Companies] ADD  DEFAULT (getdate()) FOR [createdOn]
GO
ALTER TABLE [dbo].[Companies] ADD  DEFAULT (getdate()) FOR [updatedAt]
GO
ALTER TABLE [dbo].[Companies] ADD  DEFAULT (newid()) FOR [organizationId]
GO
ALTER TABLE [dbo].[Companies] ADD  DEFAULT ((0)) FOR [defaultOffice]
GO
ALTER TABLE [dbo].[Contacts] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[Contacts] ADD  DEFAULT ('{"line1": null, "line2": null, "city": null, "state": null, "zip": null, "county": null}') FOR [address]
GO
ALTER TABLE [dbo].[Contacts] ADD  DEFAULT ('{"primary": null, "cell": null, "alternate": null, "fax": null }') FOR [phone]
GO
ALTER TABLE [dbo].[Contacts] ADD  DEFAULT ((1)) FOR [active]
GO
ALTER TABLE [dbo].[Contacts] ADD  DEFAULT ((0)) FOR [keyContact]
GO
ALTER TABLE [dbo].[Contacts] ADD  DEFAULT ('{"profileImage": null, "avatarInitials": null, "avatarColor": "#CD1B51"}') FOR [profile]
GO
ALTER TABLE [dbo].[Contacts] ADD  DEFAULT ('[{"noteText": null, "addedBy": null, "addedAt": null}]') FOR [notes]
GO
ALTER TABLE [dbo].[Contacts] ADD  DEFAULT (getdate()) FOR [createdOn]
GO
ALTER TABLE [dbo].[Contacts] ADD  DEFAULT (getdate()) FOR [updatedAt]
GO
ALTER TABLE [dbo].[Counties] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[Dropdowns] ADD  DEFAULT ('[]') FOR [items]
GO
ALTER TABLE [dbo].[Exceptions] ADD  CONSTRAINT [DF_ExceptionsLibrary_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[Files] ADD  CONSTRAINT [DF_Files_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[Files] ADD  CONSTRAINT [DF_Files_additional]  DEFAULT ('{"contiguousParcels": false, "reportConveyances": false, "reportCondemnations": false, "unrecordedDocuments": false, "judicialProceedings": false }') FOR [additional]
GO
ALTER TABLE [dbo].[Files] ADD  CONSTRAINT [DF_Files_legalDescription]  DEFAULT ('[{"parcelName": null, "stateOfInterest": null, "legalDes": null}]') FOR [legalDescription]
GO
ALTER TABLE [dbo].[Files] ADD  CONSTRAINT [DF_Files_contiguous]  DEFAULT ('[{"taxPin": null, "legalDesc": null}]') FOR [contiguous]
GO
ALTER TABLE [dbo].[Files] ADD  CONSTRAINT [DF_Files_taxes]  DEFAULT ('[{"general": {"taxPin": null}, "assessed": {"addressName": null, "line1": null, "city": null, "state": null, "zip": null}, "taxReports": {"paidThrough": null, "yearToBeReported": null, "installments": [{"amount": null, "dueDate": null, "paid": null}], "total": null, "taxSale": null}, "exceptions": [] }]') FOR [taxes]
GO
ALTER TABLE [dbo].[Files] ADD  CONSTRAINT [DF_Files_conveyances]  DEFAULT ('[]') FOR [conveyances]
GO
ALTER TABLE [dbo].[Files] ADD  CONSTRAINT [DF_Files_defendants]  DEFAULT ('[]') FOR [defendants]
GO
ALTER TABLE [dbo].[Files] ADD  CONSTRAINT [DF_Files_plaintiffs]  DEFAULT ('[]') FOR [plaintiffs]
GO
ALTER TABLE [dbo].[Files] ADD  CONSTRAINT [DF_Files_namesSearched]  DEFAULT ('[]') FOR [namesSearched]
GO
ALTER TABLE [dbo].[Files] ADD  CONSTRAINT [DF_Files_contacts]  DEFAULT ('[]') FOR [contacts]
GO
ALTER TABLE [dbo].[Files] ADD  CONSTRAINT [DF_Files_notes]  DEFAULT ('[]') FOR [notes]
GO
ALTER TABLE [dbo].[Files] ADD  CONSTRAINT [DF_Files_searcher]  DEFAULT ('[]') FOR [searcher]
GO
ALTER TABLE [dbo].[Files] ADD  CONSTRAINT [DF_Files_processor]  DEFAULT ('[]') FOR [processor]
GO
ALTER TABLE [dbo].[Files] ADD  CONSTRAINT [DF_Files_examiner]  DEFAULT ('[]') FOR [examiner]
GO
ALTER TABLE [dbo].[Files] ADD  CONSTRAINT [DF_Files_instructions]  DEFAULT ('[{"text": null, "addedBy": null}]') FOR [instructions]
GO
ALTER TABLE [dbo].[Files] ADD  CONSTRAINT [DF_Files_createdOn]  DEFAULT (getdate()) FOR [createdOn]
GO
ALTER TABLE [dbo].[Files] ADD  CONSTRAINT [DF_Files_updatedAt]  DEFAULT (getdate()) FOR [updatedAt]
GO
ALTER TABLE [dbo].[Files] ADD  CONSTRAINT [DF_Files_status]  DEFAULT ('incomplete') FOR [status]
GO
ALTER TABLE [dbo].[Files] ADD  CONSTRAINT [DF_Files_destroyed]  DEFAULT ((0)) FOR [destroyed]
GO
ALTER TABLE [dbo].[Images] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[Images] ADD  DEFAULT (getdate()) FOR [createdOn]
GO
ALTER TABLE [dbo].[Images] ADD  DEFAULT (getdate()) FOR [updatedAt]
GO
ALTER TABLE [dbo].[Notifications] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[Notifications] ADD  DEFAULT ((0)) FOR [read]
GO
ALTER TABLE [dbo].[Notifications] ADD  DEFAULT ((0)) FOR [important]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF__Orders__id__0B91BA14]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF__Orders__instruct__0C85DE4D]  DEFAULT ('{"text": null, "addedBy": null}') FOR [instructions]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF__Orders__createdO__0D7A0286]  DEFAULT (getdate()) FOR [createdOn]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF__Orders__updatedA__0E6E26BF]  DEFAULT (getdate()) FOR [updatedAt]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF__Orders__notes__0F624AF8]  DEFAULT ('[]') FOR [notes]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF__Orders__status__10566F31]  DEFAULT ('incomplete') FOR [status]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ('{"profileImage": null, "avatarInitials": null, "avatarColor": null}') FOR [profile]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((1)) FOR [active]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [createdOn]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [updatedAt]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ('[]') FOR [quickLinks]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ('WheatlandTos123') FOR [password]
GO
