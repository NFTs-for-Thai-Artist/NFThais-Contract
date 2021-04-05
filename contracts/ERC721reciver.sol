// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/IERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721Holder.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/IERC721Receiver.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/introspection/ERC165.sol";

contract Receiver721Example is IERC721Receiver, ERC165, ERC721Holder {
    constructor() {
        _registerInterface(IERC721Receiver.onERC721Received.selector);
    }
    
    function doSomethingWith721Token(IERC721 nftAddress, uint256 tokenId) external {
        // do something here
    }
}
