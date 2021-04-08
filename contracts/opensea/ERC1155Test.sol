pragma solidity ^0.5.12;

import "@ProjectOpenSea/opensea-erc1155/contracts/ERC1155Tradable.sol";

contract OpenseaERC1155 is ERC1155Tradable("Opensea ERC1155", "OSERC", _proxyRegistryAddress) {

}
