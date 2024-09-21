//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

// Useful for debugging. Remove when deploying to a live network.
import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract StoryChainContract is ERC721, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    struct Book {
        string title;
        string author;
        string pdfHash;
        uint256 rentPrice;
        uint256 rentDuration;
        address currentRenter;
        uint256 rentEndTime;
    }

	struct PdfFile {
        string fileName;
        string hash;
        string storageLocation;
    }

    mapping(uint256 => Book) public books;
	mapping (address => PdfFile[]) public pdfFiles;


    event BookUploaded(uint256 tokenId, string title, string author, string pdfHash);
    event BookRented(uint256 tokenId, address renter, uint256 rentEndTime);
    event BookReturned(uint256 tokenId);

    constructor() ERC721("StoryChainContract", "SCC") {}

    function uploadBook(string memory _title, string memory _author, string memory _pdfHash, uint256 _rentPrice, uint256 _rentDuration) public onlyOwner {
        _tokenIds.increment();
        uint256 newTokenId = _tokenIds.current();
        books[newTokenId] = Book(_title, _author, _pdfHash, _rentPrice, _rentDuration, address(0), 0);
        _mint(msg.sender, newTokenId);
        emit BookUploaded(newTokenId, _title, _author, _pdfHash);
    }

    function rentBook(uint256 _tokenId) public payable {
        require(msg.sender != ownerOf(_tokenId), "You cannot rent your own book");
        require(books[_tokenId].currentRenter == address(0), "Book is already rented");
        require(msg.value >= books[_tokenId].rentPrice, "Insufficient funds");
        books[_tokenId].currentRenter = msg.sender;
        books[_tokenId].rentEndTime = block.timestamp + books[_tokenId].rentDuration;
        emit BookRented(_tokenId, msg.sender, books[_tokenId].rentEndTime);
    }

    function returnBook(uint256 _tokenId) public {
        require(msg.sender == books[_tokenId].currentRenter, "You are not the current renter");
        require(block.timestamp >= books[_tokenId].rentEndTime, "Rent period has not ended");
        books[_tokenId].currentRenter = address(0);
        books[_tokenId].rentEndTime = 0;
        emit BookReturned(_tokenId);
    }

    function getBookInfo(uint256 _tokenId) public view returns (string memory, string memory, string memory, uint256, uint256, address, uint256) {
        return (
            books[_tokenId].title,
            books[_tokenId].author,
            books[_tokenId].pdfHash,
            books[_tokenId].rentPrice,
            books[_tokenId].rentDuration,
            books[_tokenId].currentRenter,
            books[_tokenId].rentEndTime
        );
    }

	function storePdfFile(string memory _fileName, string memory _hash, string memory _storageLocation) public {
        PdfFile memory pdfFile = PdfFile(_fileName, _hash, _storageLocation);
        pdfFiles[msg.sender].push(pdfFile);
    }

    function getPdfFiles() public view returns (PdfFile[] memory) {
        return pdfFiles[msg.sender];
    }
}