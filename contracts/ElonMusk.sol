// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/IERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/utils/ERC721Holder.sol?fbclid=IwAR3XB3oJwwh9M9sX7V_Lg_f6MPzEk0SidESdnloKgeUZqQilume4yNSvMMQ";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/IERC721Receiver.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/introspection/ERC165.sol";

contract Receiver721Example is IERC721Receiver, ERC165, ERC721Holder {
    IERC721 elon0;
    IERC721 elon1;
    IERC721 elon2;
    IERC721 elon3;
    bool public state;
    
    constructor() public {
        //_registerInterface(IERC721Receiver.onERC721Received.selector);
        elon0 = IERC721(0xb27A31f1b0AF2946B7F582768f03239b1eC07c2c);
        elon1 = IERC721(0xcD6a42782d230D7c13A74ddec5dD140e55499Df9);
        elon2 = IERC721(0xaE036c65C649172b43ef7156b009c6221B596B8b);
        elon3 = IERC721(0x9d83e140330758a8fFD07F8Bd73e86ebcA8a5692);
    }
    
    function check(uint256 tokenIdOfEL1, uint256 tokenIdOfEL2, uint256 tokenIdOfEL3) public returns(bool) {
        require(elon1.ownerOf(tokenIdOfEL1) == msg.sender);
        require(elon2.ownerOf(tokenIdOfEL2) == msg.sender);
        require(elon3.ownerOf(tokenIdOfEL3) == msg.sender);
        state = true;
        
    }
}
