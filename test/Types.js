const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Types", () => {
  beforeEach(async () => {
    const Contract = await ethers.getContractFactory("Types1");
    contract = await Contract.deploy();
  });

  describe("Example 1", () => {
    it("demonstrates boolean values", async () => {
      expect(await contract.boolean1()).to.equal(true);
      expect(await contract.boolean2()).to.equal(false);
    });

    it("demonstrates uint values", async () => {
      expect(await contract.myUint1()).to.equal(1);
      expect(await contract.myUint2()).to.equal(0);
      expect(await contract.myUint3()).to.equal(1);
      expect(await contract.myUint4()).to.equal(1);
      expect(await contract.myUint5()).to.equal(1);
    });

    it("demonstrates int values", async () => {
      expect(await contract.myInt1()).to.equal(-1);
      expect(await contract.myInt2()).to.equal(-1);
    });

    it("demonstrates str values", async () => {
      expect(await contract.str1()).to.equal("My String");
    });

    it("demonstrates addr values", async () => {
      expect(await contract.addr1()).to.equal(
        "0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC"
      );
    });
  });
});
