CREATE TABLE city
(
  cityName VARCHAR(20) NOT NULL,
  areaId NUMERIC(3) NOT NULL,
  PRIMARY KEY (cityName)
);

CREATE TABLE agent
(
  agentID NUMERIC(9) NOT NULL,
  agentName VARCHAR(20) NOT NULL,
  Rating NUMERIC(2) NOT NULL,
  HireYear NUMERIC(4) NOT NULL,
  bossID NUMERIC(9) NOT NULL,
  salary FLOAT NOT NULL,
  areaID NUMERIC(3) NOT NULL,
  PRIMARY KEY (agentID)
);

CREATE TABLE client
(
  clientID NUMERIC(9) NOT NULL,
  clientName VARCHAR(20) NOT NULL,
  agentID NUMERIC(9) NOT NULL,
  phoneNr VARCHAR(10) NOT NULL,
  cityName VARCHAR(20) NOT NULL,
  Address VARCHAR(25) NOT NULL,
  cityName VARCHAR(20) NOT NULL,
  PRIMARY KEY (clientID),
  FOREIGN KEY (cityName) REFERENCES city(cityName)
);

CREATE TABLE schedule
(
  agentId NUMERIC(9) NOT NULL,
  clientId NUMERIC(9) NOT NULL,
  meetingTime DATE NOT NULL,
  PRIMARY KEY (agentId),
  UNIQUE (clientId),
  UNIQUE (meetingTime)
);

CREATE TABLE Relationship
(
  agentID NUMERIC(9) NOT NULL,
  clientID NUMERIC(9) NOT NULL,
  PRIMARY KEY (agentID, clientID),
  FOREIGN KEY (agentID) REFERENCES agent(agentID),
  FOREIGN KEY (clientID) REFERENCES client(clientID)
);

CREATE TABLE Relationship
(
  agentId NUMERIC(9) NOT NULL,
  clientID NUMERIC(9) NOT NULL,
  PRIMARY KEY (agentId, clientID),
  FOREIGN KEY (agentId) REFERENCES schedule(agentId),
  FOREIGN KEY (clientID) REFERENCES client(clientID)
);

CREATE TABLE Relationship
(
  agentID NUMERIC(9) NOT NULL,
  agentId NUMERIC(9) NOT NULL,
  PRIMARY KEY (agentID, agentId),
  FOREIGN KEY (agentID) REFERENCES agent(agentID),
  FOREIGN KEY (agentId) REFERENCES schedule(agentId)
);

CREATE TABLE area
(
  areaId NUMERIC(3) NOT NULL,
  areaName VARCHAR(20) NOT NULL,
  cityName VARCHAR(20) NOT NULL,
  PRIMARY KEY (areaId),
  FOREIGN KEY (cityName) REFERENCES city(cityName)
);

CREATE TABLE Relationship
(
  agentID NUMERIC(9) NOT NULL,
  areaId NUMERIC(3) NOT NULL,
  PRIMARY KEY (agentID, areaId),
  FOREIGN KEY (agentID) REFERENCES agent(agentID),
  FOREIGN KEY (areaId) REFERENCES area(areaId)
);