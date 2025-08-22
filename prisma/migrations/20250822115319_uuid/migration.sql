/*
  Warnings:

  - The primary key for the `produto` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- AlterTable
ALTER TABLE "public"."produto" DROP CONSTRAINT "produto_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ADD CONSTRAINT "produto_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "produto_id_seq";
