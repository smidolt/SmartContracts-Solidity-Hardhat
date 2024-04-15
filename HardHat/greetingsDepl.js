const hre = require("hardhat");
const ethers = hre.ethers;


async function main(){
const [signer] = await hre.ethers.getSigners()

const Greeter = await ethers.getContractFactory('Greeter', signer)
const greeter = await Greeter.deploy() //Here I can set data for constructor
await greeter.waitForDeployment();
// console.log(transfers.address)
//console.log(await signer.getAddress())
}


main()
  .then (() =>process.exit(0))
.catch ((error) =>{
console.error(error);
process.exit(1);
});