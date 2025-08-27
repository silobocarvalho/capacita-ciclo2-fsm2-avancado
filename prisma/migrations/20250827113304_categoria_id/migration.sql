/*
  Warnings:

  - You are about to drop the column `categoriaId` on the `produto` table. All the data in the column will be lost.
  - Added the required column `categoria_id` to the `produto` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "produto" DROP COLUMN "categoriaId",
ADD COLUMN     "categoria_id" INTEGER NOT NULL;
