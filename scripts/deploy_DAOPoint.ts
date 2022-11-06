// const { ethers } = require("hardhat");

async function deployDAO() {
    const [deployer] = await ethers.getSigners();
    console.log("Deploying contracts with the account:", deployer.address);
    console.log("Account balance:", (await deployer.getBalance()).toString());
  
    const governorAddr = "0x1BE1601d71c382A25C306C1feb427fe79AEFA18c";
    const serverID = "1038181586232950945";

    const DAOPoint = await ethers.getContractFactory("DAOPoint");
    const daoPoint = await DAOPoint.deploy(governorAddr, serverID);
    await daoPoint.deployed();
    console.log("DAOpoint address:", daoPoint.address);
    console.log("Transaction hash:", daoPoint.deployTransaction.hash);
  }
  
  deployDAO()
    .then(() => process.exit(0))
    .catch((error) => {
      console.error(error);
      process.exit(1);
    });