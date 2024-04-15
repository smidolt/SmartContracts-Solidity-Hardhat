// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

contract Transfers 
{
  address public owner; //Owner of this trading platform 
  uint constant DURATION = 2 days;
  uint constant FEE = 10; //Percent which the owner will receive

  struct Auction
  {
    address payable seller;
    uint startingPrice; //Starting price - the highest one
    uint finallPrice; //Final price - how much the  buyer spent
    uint startAt;
    uint endsAt;
    uint discountRate; //Discount rate - shows how much money we will be discounting every second
    string item;//The description of the item or link on it
    bool stopped;
  } 
  Auction[]public auctions;//Here we will store our auctions
  event AuctionCreated(uint index, string itemName, uint startingPrice, uint duration);
  event AuctionEnded(uint index, uint finalPrice, address winner);
  constructor()
  {
    owner = msg.sender;
  }
  function createAuction(uint _startingPrice, uint _discountRate, string calldata _item, uint _duration) external // In this case, anyone can create an auction
  {
    uint duration = _duration == 0 ? DURATION : _duration;

    require(_startingPrice >= _discountRate * duration, "incorrect starting price");
    Auction memory newAuction = Auction(
    {
      seller: payable(msg.sender),
      startingPrice: _startingPrice,
      finallPrice: 0,
      startAt: block.timestamp,
      endsAt:block.timestamp + duration,
      discountRate: _discountRate,
      item: _item,
      stopped: false
    });
    auctions.push(newAuction);
    emit AuctionCreated(auctions.length-1, _item, _startingPrice, duration);
  }
  function getPrice(uint index) public view returns(uint) 
  {
    Auction memory cAuction = auctions[index];
    require(!cAuction.stopped, 'stopped!');
    uint elapsed = block.timestamp - cAuction.startAt;
    uint discount = cAuction.discountRate * elapsed; 
    return(cAuction.startingPrice - discount);
  }
  // function stop(uint index)
  // {
  //   Auction storage cAuction = auctions[index];
  //   cAuction.stopped = true;
  // }
  function buy(uint index)external payable
  {
    Auction storage cAuction = auctions[index];
    require(!cAuction.stopped, 'stopped!');
    require(block.timestamp < cAuction.endsAt, "Ended!");
    uint cPrice = getPrice(index);
    require(msg.value >= cPrice, "not enough funds");
    cAuction.stopped = true;
    uint refund = msg.value - cPrice;
    if (refund > 0) 
    {
      payable(msg.sender).transfer(refund);
    }
    cAuction.seller.transfer( 
      cPrice - ((cPrice *FEE) /100)
    );
    emit AuctionEnded(index, cPrice, msg.sender);
  }
}