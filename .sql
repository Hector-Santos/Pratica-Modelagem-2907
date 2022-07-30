-- Criação da tabela states

CREATE TABLE "states" (
	"id" SERIAL NOT NULL PRIMARY KEY,
	"name" VARCHAR(50) NOT NULL
);

-- Criação da tabela cities

CREATE TABLE "cities" (
	"id" SERIAL NOT NULL PRIMARY KEY,
	"name" VARCHAR(50) NOT NULL,
	"stateId" INTEGER NOT NULL REFERENCES "states"("id")
);

-- Criação da tabela costumers

CREATE TABLE "costumers" (
	"id" SERIAL NOT NULL PRIMARY KEY,
	"fullName" VARCHAR(50) NOT NULL,
	"cpf" INTEGER NOT NULL UNIQUE,
	"email" TEXT NOT NULL,
	"password" TEXT NOT NULL
	
);

-- Criação da tabela costumer adresses

CREATE TABLE "costumerAdresses" (
	"id" SERIAL NOT NULL PRIMARY KEY,
	"costumerId" INTEGER NOT NULL REFERENCES "costumers"("id"),
	"street" TEXT NOT NULL,
	"number" INTEGER NOT NULL,
	"complement" TEXT,
	"postalCode" INTEGER NOT NULL,
	"cityId" INTEGER NOT NULL REFERENCES "cities"("id")
);

-- Criação da tabela bank account

CREATE TABLE "bankAccount" (
	"id" SERIAL NOT NULL PRIMARY KEY,
	"costumerId" INTEGER NOT NULL REFERENCES "costumers"("id"),
	"accountNumber" INTEGER NOT NULL UNIQUE,
	"agency" TEXT NOT NULL,
	"openDate" DATE NOT NULL,
	"closeDate" DATE
);

-- Criação da tabela TRANSACTIONS

CREATE TABLE "transactions" (
	"id" SERIAL NOT NULL PRIMARY KEY,
	"bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
	"ammount" INTEGER NOT NULL DEFAULT 0,
	"type" TEXT NOT NULL,
	"time" TIMESTAMP NOT NULL,
	"description" TEXT,
	"cancelled" BOOLEAN NOT NULL
);

-- Criação da tabela creditcards

CREATE TABLE "creditCards" (
	"id" SERIAL NOT NULL PRIMARY KEY,
	"bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
	"name" VARCHAR(50),
	"number" INTEGER NOT NULL,
	"securityCode" INTEGER NOT NULL,
	"expirationMonth" INTEGER NOT NULL,
	"expirationYear" INTEGER NOT NULL,
	"password" INTEGER NOT NULL,
	"limit" INTEGER NOT NULL CHECK("limit" >0)
);

