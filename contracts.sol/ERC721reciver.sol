// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/IERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721Holder.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/IERC721Receiver.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/introspection/ERC165.sol";

contract Receiver721Example is IERC721Receiver, ERC721Holder {
    constructor(ERC721 _nftAddress1, ERC721 nftAddress2, ERC721 nftAddress3) {
        _registerInterface(IERC721Receiver.onERC721Received.selector);
        ERC721 nftAddress1 = _nftAddress1;
        ERC721 nftAddress2 = _nftAddress2;
        ERC721 nftAddress3 = _nftAddress3;
    }
    
    bool state1 = false;
    bool state2 = false;
    bool state3 = false;
    
    function checkToken1(uint256 tokenId) external {
        // check if user have token1
        require(nftAddress1.ownerOf(tokenId) == msg.sender);
        state1 = true;

    }
    
    function checkToken2(uint256 tokenId) external {
        // check if user have token2
        require(nftAddress2.ownerOf(tokenId) == msg.sender);
        state2 = true;
    }
    
    function checkToken3(uint256 tokenId) external {
        // check if user have token3
        require(nftAddress3.ownerOf(tokenId) == msg.sender);
        state3 = true;
    }
    
    function claimRewardToken(IERC721 nftAddressReward, uint256 tokenId) external {
        require(state1);
        require(state2);
        require(state3);
        
    }
}
