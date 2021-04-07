// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/IERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/utils/ERC721Holder.sol?fbclid=IwAR3XB3oJwwh9M9sX7V_Lg_f6MPzEk0SidESdnloKgeUZqQilume4yNSvMMQ";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/IERC721Receiver.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/introspection/ERC165.sol";

contract Receiver721Example is IERC721Receiver, ERC165, ERC721Holder {
    
    IERC721 public elon0;
    IERC721 public elon1;
    IERC721 public elon2;
    IERC721 public elon3;
    address public owner;
    address collector;
    uint256 public tokenIdOfEL0;
    IERC721Receiver public contractAddress;
    
    constructor(uint _intTokenId) public {
        
        //_registerInterface(IERC721Receiver.onERC721Received.selector);
        elon0 = IERC721(0xEc29164D68c4992cEdd1D386118A47143fdcF142);
        elon1 = IERC721(0x9D7f74d0C41E726EC95884E0e97Fa6129e3b5E99);
        elon2 = IERC721(0xddaAd340b0f1Ef65169Ae5E41A8b10776a75482d);
        elon3 = IERC721(0xb27A31f1b0AF2946B7F582768f03239b1eC07c2c);
        owner = msg.sender;
        tokenIdOfEL0 = _intTokenId;
    }
    
    modifier onlyOwner() {
        require(
            msg.sender == owner,
            "Only owner can call this."
        );
        _;
    }
    
    function updateContractAddress(address _contractAddress) public onlyOwner {
        contractAddress = IERC721Receiver(_contractAddress);
    }
    
    event Claim();
    
    function tokenIdIncrease() internal {
        tokenIdOfEL0++;
    }
    
    function claim(uint256 tokenIdOfEL1, uint256 tokenIdOfEL2, uint256 tokenIdOfEL3) public payable {
        require(elon1.ownerOf(tokenIdOfEL1) == msg.sender);
        require(elon2.ownerOf(tokenIdOfEL2) == msg.sender);
        require(elon3.ownerOf(tokenIdOfEL3) == msg.sender);
        
        tokenIdIncrease();
        emit Claim();
        collector = msg.sender; 
        collector.transfer(elon0, tokenIdOfEL0); //transfer nft
        
        
    }
    
}
