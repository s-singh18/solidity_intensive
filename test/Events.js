const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Events", () => {
  describe("Example 1", () => {
    let user1, user2;

    beforeEach(async () => {
      let accounts = await ethers.getSigners();
      user1 = accounts[0];
      user2 = accounts[1];
    });

    it("demonstrates basic event subscription and history", async () => {
      const Contract = await ethers.getContractFactory("Events1");
      let contract = await Contract.deploy();

      let transaction = await contract.updateMessage("Hey!");
      await transaction.wait();
      await expect(transaction)
        .to.emit(contract, "MessageUpdated")
        .withArgs(user1.address, "Hey!");

      transaction = await contract.updateMessage("Ho!");
      await transaction.wait();

      transaction = await contract.updateMessage("Ha!");
      await transaction.wait();

      let eventStream = await contract.queryFilter("MessageUpdated");
      expect(eventStream.length).to.equal(3);
      expect(eventStream[0].args[1]).to.equal("Hey!");

      transaction = await contract.connect(user2).updateMessage("Huh!");
      await transaction.wait();

      let user2Filter = contract.filters.MessageUpdated(user2.address, null);
      console.log(user2Filter);
      eventStream = await contract.queryFilter(user2Filter);
      expect(eventStream.length).to.equal(1);

      expect(eventStream[0].args[1]).to.equal("Huh!");
    });
  });
});
