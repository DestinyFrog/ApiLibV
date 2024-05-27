-- CreateTable
CREATE TABLE "Book" (
    "iid" SERIAL NOT NULL,
    "id" VARCHAR(36) NOT NULL,
    "title" TEXT NOT NULL,
    "release_year" INTEGER,
    "authorIid" INTEGER,

    CONSTRAINT "Book_pkey" PRIMARY KEY ("iid")
);

-- CreateTable
CREATE TABLE "Author" (
    "iid" SERIAL NOT NULL,
    "id" VARCHAR(36) NOT NULL,
    "name" TEXT NOT NULL,
    "nationality" TEXT NOT NULL,

    CONSTRAINT "Author_pkey" PRIMARY KEY ("iid")
);

-- CreateTable
CREATE TABLE "User" (
    "iid" SERIAL NOT NULL,
    "id" VARCHAR(36) NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" VARCHAR(36) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("iid")
);

-- CreateTable
CREATE TABLE "BookOnShelves" (
    "iid" SERIAL NOT NULL,
    "shelvesIid" INTEGER NOT NULL,
    "bookIid" INTEGER NOT NULL,

    CONSTRAINT "BookOnShelves_pkey" PRIMARY KEY ("iid")
);

-- CreateTable
CREATE TABLE "Shelves" (
    "iid" SERIAL NOT NULL,
    "id" VARCHAR(36) NOT NULL,
    "userIid" INTEGER,

    CONSTRAINT "Shelves_pkey" PRIMARY KEY ("iid")
);

-- CreateIndex
CREATE UNIQUE INDEX "Book_id_key" ON "Book"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Author_id_key" ON "Author"("id");

-- CreateIndex
CREATE UNIQUE INDEX "User_id_key" ON "User"("id");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Shelves_id_key" ON "Shelves"("id");

-- AddForeignKey
ALTER TABLE "Book" ADD CONSTRAINT "Book_authorIid_fkey" FOREIGN KEY ("authorIid") REFERENCES "Author"("iid") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BookOnShelves" ADD CONSTRAINT "BookOnShelves_shelvesIid_fkey" FOREIGN KEY ("shelvesIid") REFERENCES "Shelves"("iid") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BookOnShelves" ADD CONSTRAINT "BookOnShelves_bookIid_fkey" FOREIGN KEY ("bookIid") REFERENCES "Book"("iid") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Shelves" ADD CONSTRAINT "Shelves_userIid_fkey" FOREIGN KEY ("userIid") REFERENCES "User"("iid") ON DELETE SET NULL ON UPDATE CASCADE;
