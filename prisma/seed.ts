import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

async function main() {
  await prisma.user.createMany({
    data: [
      {
        name: "Alice",
        email: "alice@example.com",
        birthDate: new Date("1995-03-10"),
        gender: "FEMALE",
        preferredGender: "MALE",
        location: { type: "Point", coordinates: [-73.935242, 40.730610] }, // NYC
        photos: { create: [{ url: "https://example.com/alice.jpg", isMain: true }] }
      },
      {
        name: "Bob",
        email: "bob@example.com",
        birthDate: new Date("1990-07-20"),
        gender: "MALE",
        preferredGender: "FEMALE",
        location: { type: "Point", coordinates: [-73.94, 40.75] },
        photos: { create: [{ url: "https://example.com/bob.jpg", isMain: true }] }
      }
    ],
    skipDuplicates: true
  });
}

main().catch(e => console.error(e)).finally(() => prisma.$disconnect());