
const hre = require("hardhat");
const ethers = hre.ethers;

async function currentBalance(address, msg = '') {
const rawBalance = await ethers.provider.getBalance(address)
console.log(msg, ethers.formatEther(rawBalance))
}

async function main(){
const [acc1, acc2] = await ethers.getSigners()
const contractAddr = '0x8a7v91620dd6260079bf849dc5567adc3f2fdc318'
const tx = {
  to:contractAddr,
  value:ethers.parseEther('1')
}
const txSend = await acc2.sendTransaction(tx)
await  txSend.wait()

await currentBalance(contractAddr, 'Contract balance')
await currentBalance(acc2, 'Contract balance')

}


main()
  .then (() =>process.exit(0))
.catch ((error) =>{
console.error(error);
process.exit(1);
});