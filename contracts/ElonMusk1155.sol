// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/introspection/ERC165.sol";
import "@openzeppelin/contracts/token/ERC1155/utils/ERC1155Holder.sol";
import "@openzeppelin/contracts/token/ERC1155/IERC1155.sol";

contract ElonMusk1155 {
    
    IERC1155 public elon;

    address public owner;
    address collector;
    
    // This is the set reward tokenId
    uint256 public tokenIdOfEL0 = 4;
    
    // This is the required nft
    uint256 public tokenIdOfEL1 = 1;
    uint256 public tokenIdOfEL2 = 2;
    uint256 public tokenIdOfEL3 = 3;
    
    address public minterAddress;
    
    mapping(address => bool) public alreadyClaimed;
    
    constructor(address _minterAddress) public {
        //_registerInterface(IERC721Receiver.onERC721Received.selector);
        minterAddress = _minterAddress;
        elon = IERC1155(0xd9145CCE52D386f254917e481eB44e9943F39138);
        owner = msg.sender;
    }
    
    modifier onlyOwner() {
        require(
            msg.sender == owner,
            "Only owner can call this."
        );
        _;
    }
    
    event UpdateMinterAddress(address indexed oldMinterAddress, address indexed minterAddress);
    
    function updateMinterAddress(address _minterAddress) public onlyOwner {
        emit UpdateMinterAddress(minterAddress, _minterAddress);
        minterAddress = _minterAddress;
    }
    
    event Claim(address indexed claimer);
    
    function claim() public {
        require(!alreadyClaimed[msg.sender], "Already Claimed");
        require(elon.balanceOf(msg.sender, tokenIdOfEL1) >= 1, "Not enough token 1");
        require(elon.balanceOf(msg.sender, tokenIdOfEL2) >= 1, "Not enough token 2");
        require(elon.balanceOf(msg.sender, tokenIdOfEL3) >= 1, "Not enough token 3");
        
        // Transfer nft directly from the owner (Require owner approval)
        elon.safeTransferFrom(minterAddress, msg.sender, tokenIdOfEL0, 1, "");
        
        alreadyClaimed[msg.sender] = true;
        
        emit Claim(msg.sender);
    }
    
}
