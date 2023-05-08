-- CreateEnum
CREATE TYPE "Genero" AS ENUM ('MASCULINO', 'FEMININO');

-- CreateEnum
CREATE TYPE "EstadoCivil" AS ENUM ('SOLTEIRO', 'CASADO', 'VIUVO');

-- CreateEnum
CREATE TYPE "Cor" AS ENUM ('BRANCA', 'PRETA', 'PARDA', 'AMARELA', 'INDIGENA');

-- CreateEnum
CREATE TYPE "TipoSanguineo" AS ENUM ('A_POSITIVO', 'A_NEGATIVO', 'B_POSITIVO', 'B_NEGATIVO', 'AB_POSITIVO', 'AB_NEGATIVO', 'O_POSITIVO', 'O_NEGATIVO');

-- CreateTable
CREATE TABLE "doadores" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "nome" VARCHAR(255) NOT NULL,
    "data_nascimento" TIMESTAMP(3) NOT NULL,
    "genero" "Genero" NOT NULL,
    "estado_civil" "EstadoCivil" NOT NULL,
    "cor" "Cor" NOT NULL,
    "cartao_sus" VARCHAR(18) NOT NULL,
    "cpf" VARCHAR(14) NOT NULL,
    "senha" TEXT NOT NULL,
    "tipo_sanguineo" "TipoSanguineo" NOT NULL,
    "peso" DOUBLE PRECISION NOT NULL,
    "altura" DOUBLE PRECISION NOT NULL,
    "telefone" VARCHAR(15) NOT NULL,

    CONSTRAINT "doadores_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "enderecos" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "rua" VARCHAR(255) NOT NULL,
    "bairro" VARCHAR(100) NOT NULL,
    "numero" VARCHAR(10) NOT NULL,
    "complemento" VARCHAR(100) NOT NULL,
    "cidade" VARCHAR(50) NOT NULL,
    "doadorId" TEXT NOT NULL,

    CONSTRAINT "enderecos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "campanhas" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "titulo" VARCHAR(50) NOT NULL,
    "descricao" VARCHAR(500) NOT NULL,
    "foto" BYTEA NOT NULL,
    "aceito" BOOLEAN NOT NULL DEFAULT false,
    "tipo_sanguineo" "TipoSanguineo"[],
    "solicitanteId" TEXT NOT NULL,
    "pacienteId" TEXT NOT NULL,

    CONSTRAINT "campanhas_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "doacoes" (
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "doadorId" TEXT NOT NULL,
    "campanhaId" TEXT NOT NULL,
    "tipo_sanguineo" "TipoSanguineo" NOT NULL,

    CONSTRAINT "doacoes_pkey" PRIMARY KEY ("doadorId","campanhaId")
);

-- CreateIndex
CREATE UNIQUE INDEX "doadores_cartao_sus_key" ON "doadores"("cartao_sus");

-- CreateIndex
CREATE UNIQUE INDEX "doadores_cpf_key" ON "doadores"("cpf");

-- CreateIndex
CREATE UNIQUE INDEX "enderecos_doadorId_key" ON "enderecos"("doadorId");

-- AddForeignKey
ALTER TABLE "enderecos" ADD CONSTRAINT "enderecos_doadorId_fkey" FOREIGN KEY ("doadorId") REFERENCES "doadores"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "campanhas" ADD CONSTRAINT "campanhas_solicitanteId_fkey" FOREIGN KEY ("solicitanteId") REFERENCES "doadores"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "campanhas" ADD CONSTRAINT "campanhas_pacienteId_fkey" FOREIGN KEY ("pacienteId") REFERENCES "doadores"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "doacoes" ADD CONSTRAINT "doacoes_doadorId_fkey" FOREIGN KEY ("doadorId") REFERENCES "doadores"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "doacoes" ADD CONSTRAINT "doacoes_campanhaId_fkey" FOREIGN KEY ("campanhaId") REFERENCES "campanhas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
