// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract PfpHub is ERC1155 {
    uint256 public constant FRAMES = 0;
    uint256 public constant OVERLAYS = 1;
    uint256 public constant DECORATIONS = 2;

    mapping(uint256 => string) private _uris;

    constructor() ERC1155("https://game.example/api/item/{id}.json") {
        //mint contrats here
        _mint(msg.sender, FRAMES, 10 ** 18, "");
        _mint(msg.sender, OVERLAYS, 10 ** 27, "");
        _mint(msg.sender, DECORATIONS, 1, "");
    }

    //set images ourselves
    function uri(uint256 tokenId) public view override returns (string memory) {
        return (_uris[tokenId]);
    }

    function setTokenUri(uint256 tokenId, string memory uri) public {
        require(bytes(_uris[tokenId]).length == 0, "Cannot set uri twice");
        _uris[tokenId] = uri;
    }
}
