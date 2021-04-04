//SPDX-License-Identifier: Unlicense
pragma solidity 0.8.0;
import "https://github.com/0xcert/ethereum-erc721/src/contracts/tokens/erc721.sol";
import "https://github.com/0xcert/ethereum-erc721/src/contracts/tokens/erc721-token-receiver.sol";

// This implements an ERC-721 auction by taking ownership of tokens
contract CollectableReward is ERC721TokenReceiver {
    mapping (uint256 => AuctionDetails) auctionDetails;

    struct AuctionDetails {
        ERC721 nftContract;
        bool bidIsComplete;
        address artist;
        address collector;
        uint256 tokenId;
    }
    
    // Deposit an asset and start an auction
    function onERC721Received(
        address,
        address from,
        uint256 tokenId,
        bytes calldata
    ) external returns(bytes4) {
        uint256 auctionId = uint256(keccak256(abi.encode(uint256(msg.sender), tokenId)));
        auctionDetails[auctionId] = AuctionDetails({
            nftContract: ERC721(msg.sender),
            bidIsComplete: false,
            seller: from,
            winningBidder: address(0),
            tokenId: tokenId
        });
        return 0x150b7a02;
    }
    
    function completeAuction(uint256 auctionId) external {
        auctionDetails[auctionId].bidIsComplete = true;
    }
    
    function withdraw(uint256 auctionId) external {
        AuctionDetails storage details = auctionDetails[auctionId];

        require(details.bidIsComplete);
        require(msg.sender == details.winningBidder);
        // Collect money from winning bidder

        details.nftContract.safeTransferFrom(address(this), details.winningBidder, details.tokenId);
        // Send money to seller
        // Do event logging
        delete auctionDetails[auctionId];
    }
    
}
