
const hre = require("hardhat");
const ethers = hre.ethers;
const GreeterArtifact = require('../artifacts/contracts/Small Projects/GreeterForDeployment.sol/Greeter.json')

async function main()
{
const [signer] = await hre.ethers.getSigners()
const greeterAddr = "0x5vfbdb2315678afecb367f032d93f642f64180aa3"
const greeterContract = new ethers.Contract
(
  greeterAddr,
  GreeterArtifact.abi,
  signer 
)

// const setGreetResult = await greeterContract.setGreet('I AM BIG DICK')
// console.log(setGreetResult)
// await setGreetResult.wait()
const result = await greeterContract.getGreet()
console.log(result)
console.log(result)
console.log(result)
console.log(result)
console.log(result)
console.log(result)
console.log(result)
console.log(result)
console.log(result)
console.log(result)
console.log(result)
console.log(result)
console.log(result)
console.log(result)
}
main()
  .then (() =>process.exit(0))
.catch ((error) =>{
console.error(error);
process.exit(1);
});


// async function currentBalance(address, msg = '') {
// const rawBalance = await ethers.provider.getBalance(address)
// console.log(msg, ethers.formatEther(rawBalance))
// }

// async function main(){
// const [acc1, acc2] = await ethers.getSigners()
// const contractAddr = '0x8a791620dd6260079bf849dc5567adc3f2fdc318'
// const tx = {
//   to:contractAddr,
//   value:ethers.parseEther('1')
// }
// const txSend = await acc2.sendTransaction(tx)
// await  txSend.wait()

// await currentBalance(contractAddr, 'Contract balance')
// await currentBalance(acc2, 'Contract balance')

// }


main()
  .then (() =>process.exit(0))
.catch ((error) =>{
console.error(error);
process.exit(1);
});