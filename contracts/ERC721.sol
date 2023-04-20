// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ERC721 {

  event Transfer(
    address indexed from,
    address indexed to,
    uint256 indexed tokenId);

  mapping(uint => address) private _tokenOwner;
  mapping(address => uint) private _OwnedTokensCount;

  function balanceOf(address _owner) public view returns(uint256) {
    require(_owner !=address(0), 'owner query for nonexistent token');
    return _OwnedTokensCount[_owner];
  }

  function ownerOf(uint256 _tokenId) external view returns(address) {
    address owner = _tokenOwner[_tokenId];
    require(owner !=address(0), 'owner query for nonexistent token');
    return owner;
  }

  function _exists(uint256 tokenId) internal view returns(bool) {
    address owner = _tokenOwner[tokenId];
    return owner != address(0);
  }

  function _mint(address to, uint256 tokenId) internal {
    require(to !=address(0), 'ERC721: minting to the zero address');
    require(!_exists(tokenId), 'ERC721: token already minted');

    _tokenOwner[tokenId] = to;
    _OwnedTokensCount[to] += 1;

    emit Transfer(address(0), to, tokenId);
  }
}