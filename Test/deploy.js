const hre = require("hardhat");
const ethers = hre.ethers;


async function main(){
const [signer] = await hre.ethers.getSigners()

const Transfers = await ethers.getContractFactory('Transfers', signer)
const transfers = await Transfers.deploy(10) //Here I can set data for constructor
await transfers.waitForDeployment();

console.log(transfers.address)
//console.log(await signer.getAddress())
}


main()
  .then (() =>process.exit(0))
.catch ((error) =>{
console.error(error);
process.exit(1);
});