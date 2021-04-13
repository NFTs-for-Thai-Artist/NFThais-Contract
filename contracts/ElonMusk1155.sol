// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/introspection/ERC165.sol";
import "@openzeppelin/contracts/token/ERC1155/utils/ERC1155Holder.sol";
import "@openzeppelin/contracts/token/ERC1155/IERC1155.sol";

contract ElonMusk1155Receiver is ERC1155Holder {
    
    IERC1155 public elon;

    address public owner;
    address collector;
    
    // This is the set reward tokenId
    uint256 public tokenIdOfEL0 = 4;
    
    // This is the required nft
    uint256 public tokenIdOfEL1 = 1;
    uint256 public tokenIdOfEL2 = 2;
    uint256 public tokenIdOfEL3 = 3;
    
    address public contractAddress;
    
    constructor() public {
        //_registerInterface(IERC721Receiver.onERC721Received.selector);
        contractAddress = 0xd9145CCE52D386f254917e481eB44e9943F39138;
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
    
    event UpdateContractAddress(address indexed oldContractAddress, address indexed contractAddress);
    
    function updateContractAddress(address _contractAddress) public onlyOwner {
        emit UpdateContractAddress(contractAddress, _contractAddress);
        contractAddress = _contractAddress;
    }
    
    event Claim(address indexed claimer);
    
    function claim(uint256 tokenIdOfEL1, uint256 tokenIdOfEL2, uint256 tokenIdOfEL3) public payable {
        require(elon.balanceOf(msg.sender, tokenIdOfEL1) >= 1);
        require(elon.balanceOf(msg.sender, tokenIdOfEL2) >= 1);
        require(elon.balanceOf(msg.sender, tokenIdOfEL3) >= 1);
        
        // Transfer nft directly from the owner (Require owner approval)
        elon.safeTransferFrom(contractAddress, msg.sender, tokenIdOfEL0, 1, "");
        
        emit Claim(msg.sender);
    }
    
}
