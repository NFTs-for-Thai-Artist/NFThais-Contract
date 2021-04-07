// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/introspection/ERC165.sol";
import "@openzeppelin/contracts/token/ERC1155/ERC1155Holder.sol";
import "@openzeppelin/contracts/token/ERC1155/IERC1155.sol";

contract ElonMusk1155Receiver is ERC1155Holder {
    
    IERC1155 public elon0;
    IERC1155 public elon1;
    IERC1155 public elon2;
    IERC1155 public elon3;
    address public owner;
    address collector;
    
    // This is the set reward tokenId
    uint256 public tokenIdOfEL0 = 0;
    
    // This is the required nft
    uint256 public tokenIdOfEL1 = 1;
    uint256 public tokenIdOfEL2 = 2;
    uint256 public tokenIdOfEL3 = 3;
    
    ERC1155Holder public contractAddress;
    
    constructor() public {
        
        //_registerInterface(IERC721Receiver.onERC721Received.selector);
        elon0 = IERC1155(0xEc29164D68c4992cEdd1D386118A47143fdcF142);
        elon1 = IERC1155(0x9D7f74d0C41E726EC95884E0e97Fa6129e3b5E99);
        elon2 = IERC1155(0xddaAd340b0f1Ef65169Ae5E41A8b10776a75482d);
        elon3 = IERC1155(0xb27A31f1b0AF2946B7F582768f03239b1eC07c2c);
        owner = msg.sender;
    }
    
    modifier onlyOwner() {
        require(
            msg.sender == owner,
            "Only owner can call this."
        );
        _;
    }
    
    function updateContractAddress(address _contractAddress) public onlyOwner {
        contractAddress = ERC1155Holder(_contractAddress);
    }
    
    event Claim(address indexed claimer);
    
    function tokenIdIncrease() internal {
        tokenIdOfEL0++;
    }
    
    function claim(uint256 tokenIdOfEL1, uint256 tokenIdOfEL2, uint256 tokenIdOfEL3) public payable {
        require(elon1.balanceOf(msg.sender, tokenIdOfEL1) >= 1);
        require(elon2.balanceOf(msg.sender, tokenIdOfEL2) >= 1);
        require(elon3.balanceOf(msg.sender, tokenIdOfEL3) >= 1);
        
        //tokenIdIncrease();
        emit Claim(msg.sender);
        collector = msg.sender; 
        collector.transfer(elon0, tokenIdOfEL0); //transfer nft
        
        
    }
    
}
