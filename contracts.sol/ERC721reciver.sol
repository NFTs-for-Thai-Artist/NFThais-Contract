import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/IERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721Holder.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/IERC721Receiver.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/introspection/ERC165.sol";

contract Receiver721Example is IERC721Receiver, ERC165, ERC721Holder {
    constructor() {
        _registerInterface(IERC721Receiver.onERC721Received.selector);
    }
    
    function checkToken1(IERC721 nftAddress1, uint256 tokenId) external {
        // do something here
    }
    
    function checkToken2(IERC721 nftAddress2, uint256 tokenId) external {
        // do something here
    }
    
    function checkToken3(IERC721 nftAddress3, uint256 tokenId) external {
        // do something here
    }
    
    function claimRewardToken(IERC721 nftAddressReward, uint256 tokenId) external {
        // do something here
    }
}
