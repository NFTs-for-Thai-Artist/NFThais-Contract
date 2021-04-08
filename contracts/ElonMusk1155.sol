// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/introspection/ERC165.sol";
import "@openzeppelin/contracts/token/ERC1155/ERC1155Holder.sol";
import "@openzeppelin/contracts/token/ERC1155/IERC1155.sol";

contract ElonMusk1155Receiver is ERC1155Holder {
    
    IERC1155 public elon;

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
        elon = IERC1155(0xEc29164D68c4992cEdd1D386118A47143fdcF142);
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
    
    function claim(uint256 tokenIdOfEL1, uint256 tokenIdOfEL2, uint256 tokenIdOfEL3) public payable {
        require(elon.balanceOf(msg.sender, tokenIdOfEL1) >= 1);
        require(elon.balanceOf(msg.sender, tokenIdOfEL2) >= 1);
        require(elon.balanceOf(msg.sender, tokenIdOfEL3) >= 1);
        
        // Transfer nft directly from the owner (Require owner approval)
        safeTransferFrom(contractAddress, msg.sender, tokenIdOfEL0, 1, "");
        
        emit Claim(msg.sender);
    }
    
}
