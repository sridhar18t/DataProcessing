CREATE TABLE MOVIES(
MovieID int,
Title text NOT NULL,
PRIMARY KEY (MovieID)
);

CREATE TABLE USERS(
UserID int,
Name text NOT NULL,
PRIMARY KEY(UserID)
);

CREATE TABLE Taginfo(
TagID int,
Content text NOT NULL,
PRIMARY KEY (TagID)
);

CREATE TABLE Genres(
GenreID int ,
Name text NOT NULL,
PRIMARY KEY (GenreID)
);

CREATE TABLE Ratings(
UserID int NOT NULL,
MovieID int NOT NULL,
Rating numeric NOT NULL,
PRIMARY KEY (MovieID, UserID),
FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
FOREIGN KEY (UserID) REFERENCES Users(UserID),
CONSTRAINT Rat_mv_us UNIQUE (UserID, MovieID, Rating),
CHECK(0 <= Rating and Rating <= 5),
timestamp bigint not null
default (extract(epoch from now()))
);


CREATE TABLE Tags(
UserID int NOT NULL,
MovieID int NOT NULL,
TagID int NOT NULL,
PRIMARY KEY (MovieID, UserID,TagID),
FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
FOREIGN KEY (UserID) REFERENCES Users(UserID),
FOREIGN KEY (TagID) REFERENCES TagInfo(TagID),
timestamp bigint not null
default (extract(epoch from now()) )	
);

CREATE TABLE HASAGENRE(
MovieID int NOT NULL,
GenreID int NOT NULL,
PRIMARY KEY (GenreID,MovieID),
FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
FOREIGN KEY (GenreID) REFERENCES Genres(GenreID)
);
