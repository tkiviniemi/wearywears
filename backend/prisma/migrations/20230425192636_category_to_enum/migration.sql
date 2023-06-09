-- CreateEnum
CREATE TYPE "category" AS ENUM ('SHIRTS', 'JACKETS', 'PANTS', 'SHORTS', 'SKIRTS', 'DRESSES', 'SHOES', 'HATS', 'ACCESSORIES', 'OTHER');

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "password" TEXT NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Listing" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "price" INTEGER NOT NULL,
    "category" "category" NOT NULL DEFAULT 'OTHER',
    "postedById" TEXT NOT NULL,

    CONSTRAINT "Listing_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_FavoritedListings" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE INDEX "email" ON "User"("email");

-- CreateIndex
CREATE INDEX "postedById" ON "Listing"("postedById");

-- CreateIndex
CREATE UNIQUE INDEX "_FavoritedListings_AB_unique" ON "_FavoritedListings"("A", "B");

-- CreateIndex
CREATE INDEX "_FavoritedListings_B_index" ON "_FavoritedListings"("B");

-- AddForeignKey
ALTER TABLE "Listing" ADD CONSTRAINT "Listing_postedById_fkey" FOREIGN KEY ("postedById") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FavoritedListings" ADD CONSTRAINT "_FavoritedListings_A_fkey" FOREIGN KEY ("A") REFERENCES "Listing"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FavoritedListings" ADD CONSTRAINT "_FavoritedListings_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
