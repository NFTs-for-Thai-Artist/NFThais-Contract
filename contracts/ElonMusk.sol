// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/IERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/utils/ERC721Holder.sol?fbclid=IwAR3XB3oJwwh9M9sX7V_Lg_f6MPzEk0SidESdnloKgeUZqQilume4yNSvMMQ";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/IERC721Receiver.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/introspection/ERC165.sol";

contract Receiver721Example is IERC721Receiver, ERC165, ERC721Holder {
    constructor(IERC721 elon0_, IERC721 elon1_, IERC721 elon2_, IERC721 elon3_) {
        IERC721 _elon0 = elon0_;
        IERC721 _elon1 = elon1_;
        IERC721 _elon2 = elon2_;
        IERC721 _elon3 = elon3_;
    }
    
    function doSomethingWith721Token(IERC721 nftAddress, uint256 tokenId) external {
        // do something here
    }
}
