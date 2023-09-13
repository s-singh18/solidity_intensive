const { expect } = require("chai");
const { ethers } = require("hardhat");
const { time } = require("@nomicfoundation/hardhat-network-helpers");

const tokens = (n) => {
  return ethers.utils.parseUnits(n.toString(), "ether");
};

const ether = tokens;

describe("Time Examples", () => {
  describe("Example 1", () => {
    it("demonstrates time restriction with block.timestamp", async () => {
      // Configure time
      let now = await time.latest();

      // Uncomment this to see the current timestamp
      let depositStartTime = now + 1000;
      let withdrawStartTime = now + 2000;

      const Contract = await ethers.getContractFactory("Time1");
      const contract = await Contract.deploy(
        depositStartTime,
        withdrawStartTime
      );

      await expect(contract.deposit({ value: ether(1) })).to.be.reverted;

      await time.increaseTo(depositStartTime + 1);

      await contract.deposit({ value: ether(1) });
      expect(await ethers.provider.getBalance(contract.address)).to.equal(
        ether(1)
      );

      await expect(contract.withdraw()).to.be.reverted;

      await time.increaseTo(withdrawStartTime + 1);

      await contract.withdraw();
      expect(await ethers.provider.getBalance(contract.address)).to.equal(
        ether(0)
      );
    });
  });
});
