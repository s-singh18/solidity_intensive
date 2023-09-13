const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Structs", () => {
  describe("Example 1", () => {
    it("demonstrates read / write / update behavior of structs", async () => {
      const Contract = await ethers.getContractFactory("Structs1");
      let contract = await Contract.deploy();

      let bookTitles = ["A Tale of Two Cities", "Les Miserables", "The Hobbit"];
      let bookAuthors = ["Charles Dickens", "Victor Hugo", "J.R.R. Tolkien"];

      await contract.add1("A Tale of Two Cities", "Charles Dickens");
      await contract.add2("Les Miserables", "Victor Hugo");
      await contract.add3("The Hobbit", "J.R.R. Tolkien");

      let books = await contract.books();
      for (let i = 0; i < books.length; i++) {
        let result = await contract.get(0);
        expect(result[0]).to.equal(bookTitles[i]);
        expect(result[1]).to.equal(bookAuthors[i]);
        expect(result[2]).to.equal(false);

        // TOOD: homework - check the other books

        // Complete a book
        await contract.complete(0);
        result = await contract.get(0);
        expect(result[2]).to.equal(true);
      }
    });
  });
});
