
IF OBJECT_ID(N'[dbo].[FK_CustomerOrders]', 'F') IS NOT NULL ALTER TABLE [Orders] DROP CONSTRAINT [FK_CustomerOrders];
IF OBJECT_ID(N'[dbo].[FK_OrderOrderDetails]', 'F') IS NOT NULL ALTER TABLE [OrderDetails] DROP CONSTRAINT [FK_OrderOrderDetails];
IF OBJECT_ID(N'[dbo].[FK_ProductOrderDetails]', 'F') IS NOT NULL ALTER TABLE [OrderDetails] DROP CONSTRAINT [FK_ProductOrderDetails];
IF OBJECT_ID(N'[dbo].[Customers]', 'U') IS NOT NULL DROP TABLE [Customers];
IF OBJECT_ID(N'[dbo].[Orders]', 'U') IS NOT NULL DROP TABLE [Orders];
IF OBJECT_ID(N'[dbo].[OrderDetails]', 'U') IS NOT NULL DROP TABLE [OrderDetails];
IF OBJECT_ID(N'[dbo].[Products]', 'U') IS NOT NULL DROP TABLE [Products];


CREATE TABLE [Customers] (
  [CustomerId] [int] NOT NULL IDENTITY, 
  [FirstName] [nvarchar](max) NOT NULL , 
  [LastName] [nvarchar] (max) NOT NULL , 
  [Company] [nvarchar](max), 
  [EmailAddress] [nvarchar](max), 
  [WorkPhone] [nvarchar](max), 
  [HomePhone] [nvarchar](max), 
  [Address] [nvarchar](max), 
  [City] [nvarchar](max), 
  [State] [nvarchar](max), 
  [Zipcode] [nvarchar](max), 
  CONSTRAINT [PK_Customers] PRIMARY KEY ([CustomerId]) 
)

CREATE TABLE [Orders] (
  [OrderId] [int] NOT NULL IDENTITY, 
  [CustomerId] [int] NOT NULL, 
  [OrderDate] [datetime] NOT NULL, 
  [OrderAmount] [decimal](18, 2) NOT NULL, 
  CONSTRAINT [PK_Orders] PRIMARY KEY ([OrderId]) 
)

CREATE INDEX [IX_CustomerId] ON [Orders]([CustomerId])


CREATE TABLE [OrderDetails] (
  [Id] [int] NOT NULL IDENTITY, 
  [OrderId] [int] NOT NULL, 
  [ProductId] [int] NOT NULL, 
  [Quantity] [int] NOT NULL, 
  [Total] [decimal](18, 2) NOT NULL, 
  CONSTRAINT [PK_OrderDetails] PRIMARY KEY ([Id]) 
)

CREATE INDEX [IX_OrderId] ON [OrderDetails]([OrderId])
CREATE INDEX [IX_ProductId] ON [OrderDetails]([ProductId])

CREATE TABLE [Products] (
  [ProductId] [int] NOT NULL IDENTITY, 
  [Product] [nvarchar](max), 
  [Category] [nvarchar](max), 
  [ListPrice] [decimal](18, 2) NOT NULL, 
  [Description] [nvarchar](max), 
  [ProductImage] [nvarchar](max)
  CONSTRAINT [PK_Products] PRIMARY KEY ([ProductId])
)

ALTER TABLE [Orders] ADD CONSTRAINT [FK_CustomerOrders] FOREIGN KEY ([CustomerId]) REFERENCES [Customers] ([CustomerId]) ON DELETE CASCADE
ALTER TABLE [OrderDetails] ADD CONSTRAINT [FK_OrderOrderDetails] FOREIGN KEY ([OrderId]) REFERENCES [Orders] ([OrderId]) ON DELETE CASCADE
ALTER TABLE [OrderDetails] ADD CONSTRAINT [FK_ProductOrderDetails] FOREIGN KEY ([ProductId]) REFERENCES [Products] ([ProductId]) ON DELETE CASCADE

INSERT INTO Products (Product, Category, ListPrice, Description, ProductImage) VALUES ('Batman Action Figure', 'Action Figures', 14.95, 'A super hero who sometimes plays the role of a dark knight.', 'https://cptlabs.blob.core.windows.net/images/batman.jpg')
INSERT INTO Products (Product, Category, ListPrice, Description, ProductImage) VALUES ('Captain America Action Figure', 'Action Figures', 12.95, 'A super action figure that protects freedom and the American way of life.', 'https://cptlabs.blob.core.windows.net/images/captainamerica.jpg')
INSERT INTO Products (Product, Category, ListPrice, Description, ProductImage) VALUES ('GI Joe Action Figure', 'Action Figures', 14.95, 'A classic action figure from the 1970s.', 'https://cptlabs.blob.core.windows.net/images/gijoe.jpg')
INSERT INTO Products (Product, Category, ListPrice, Description, ProductImage) VALUES ('Green Hulk Action Figure', 'Action Figures', 9.95, 'An overly muscular action figure that strips naked when angry.', 'https://cptlabs.blob.core.windows.net/images/hulk.jpg')
INSERT INTO Products (Product, Category, ListPrice, Description, ProductImage) VALUES ('Godzilla Action Figure', 'Action Figures', 19.95, 'The classic and adorable action figure from those old Japanese movies.', 'https://cptlabs.blob.core.windows.net/images/godzilla.jpg')
INSERT INTO Products (Product, Category, ListPrice, Description, ProductImage) VALUES ('Twitter Follower Action Figure', 'Action Figures', 1, 'An inexpensive action figure you can never have too many of.', 'https://cptlabs.blob.core.windows.net/images/twitterfollower.jpg')
INSERT INTO Products (Product, Category, ListPrice, Description, ProductImage) VALUES ('Crayloa Crayon Set', 'Arts and Crafts', 2.49, 'A very fun set of crayons in every color.', 'https://cptlabs.blob.core.windows.net/images/crayons.jpg')
INSERT INTO Products (Product, Category, ListPrice, Description, ProductImage) VALUES ('Sponge Bob Coloring Book', 'Arts and Crafts', 2.95, 'A drawing extravaganza based on America''s most recognizable celebrity.', 'https://cptlabs.blob.core.windows.net/images/coloringbook.jpg')
INSERT INTO Products (Product, Category, ListPrice, Description, ProductImage) VALUES ('Easel with Supply Trays', 'Arts and Crafts', 49.95, 'A serious easel for serious young artists.', 'https://cptlabs.blob.core.windows.net/images/coloringbook.jpg')
INSERT INTO Products (Product, Category, ListPrice, Description, ProductImage) VALUES ('Crate o'' Crayons', 'Arts and Crafts', 14.95, 'More crayons that you can shake a stick at.', 'https://cptlabs.blob.core.windows.net/images/crateocrayons.jpg')
INSERT INTO Products (Product, Category, ListPrice, Description, ProductImage) VALUES ('Etch A Sketch', 'Arts and Crafts', 12.95, 'A strategic planning tool for the Romney campaign.', 'https://cptlabs.blob.core.windows.net/images/etchasketch.jpg')
INSERT INTO Products (Product, Category, ListPrice, Description, ProductImage) VALUES ('Green Hornet', 'Remote Control', 24.95, 'A fast car for crusin'' the strip at night.', 'https://cptlabs.blob.core.windows.net/images/greenhornet.jpg')
INSERT INTO Products (Product, Category, ListPrice, Description, ProductImage) VALUES ('Stomper Bully', 'Remote Control', 29.95, 'A great toy that can crush and destroy all your other toys.', 'https://cptlabs.blob.core.windows.net/images/stomperbully.jpg')
INSERT INTO Products (Product, Category, ListPrice, Description, ProductImage) VALUES ('Indy Race Car', 'Remote Control', 19.95, 'The fastest remote control race car on the market today.', 'https://cptlabs.blob.core.windows.net/images/indyracecar.jpg')
INSERT INTO Products (Product, Category, ListPrice, Description, ProductImage) VALUES ('Turbo-boost Speedboat', 'Remote Control', 32.95, 'The preferred water vehicle of gun runners and drug kingpins.', 'https://cptlabs.blob.core.windows.net/images/speedboat.jpg')
INSERT INTO Products (Product, Category, ListPrice, Description, ProductImage) VALUES ('Flying Squirrel', 'Remote Control', 69.95, 'A stealthy remote control plane that flies on the down-low and under the radar.', 'https://cptlabs.blob.core.windows.net/images/flyingsquirrel.jpg')
INSERT INTO Products (Product, Category, ListPrice, Description, ProductImage) VALUES ('Seal Team 6 Helicopter', 'Remote Control', 59.95, 'A serious helicopter that can open up a can of whoop-ass when required.', 'https://cptlabs.blob.core.windows.net/images/helicopter.jpg')