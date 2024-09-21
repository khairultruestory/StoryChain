// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FileStorage {
    // Mapping of file names to IPFS hashes
    mapping (string => string) public storyName;

    // Mapping of file names to owners
    mapping (string => address) public storyOwnerss;

    // Mapping of file names to rent status
    mapping (string => bool) public storyRentStatus;

    // Mapping of file names to renters
    mapping (string => address) public storyRenters;

    // Event emitted when a file is uploaded
    event FileUploaded(string fileName, string ipfsHash, address owner);

    // Event emitted when a file's rent status is updated
    event storyRentStatusUpdated(string fileName, bool rentEnabled);

    // Event emitted when a file is rented
    event FileRented(string fileName, address renter);

    // Function to upload a file
    function uploadStory(string memory fileName, string memory ipfsHash) public {
        // Check if the file already exists
        require(bytes(storyName[fileName]).length == 0, "File already exists");

        // Set the IPFS hash and owner of the file
        storyName[fileName] = ipfsHash;
        storyOwnerss[fileName] = msg.sender;

        // Initialize rent status to disabled
        storyRentStatus[fileName] = false;

        // Emit the FileUploaded event
        emit FileUploaded(fileName, ipfsHash, msg.sender);
    }

    // Function to retrieve the IPFS hash of a file
    function getStoryHash(string memory fileName) public view returns (string memory) {
        return storyName[fileName];
    }

    // Function to verify the ownership of a file
    function verifyOwnership(string memory fileName, address owner) public view returns (bool) {
        return storyOwnerss[fileName] == owner;
    }

    // Function to enable renting of a file
    function enableRenting(string memory fileName) public {
        // Check if the file exists and the caller is the owner
        require(bytes(storyName[fileName]).length > 0, "File does not exist");
        require(storyOwnerss[fileName] == msg.sender, "Only the owner can enable renting");

        // Enable renting
        storyRentStatus[fileName] = true;

        // Emit the storyRentStatusUpdated event
        emit storyRentStatusUpdated(fileName, true);
    }

    // Function to disable renting of a file
    function disableRenting(string memory fileName) public {
        // Check if the file exists and the caller is the owner
        require(bytes(storyName[fileName]).length > 0, "File does not exist");
        require(storyOwnerss[fileName] == msg.sender, "Only the owner can disable renting");

        // Disable renting
        storyRentStatus[fileName] = false;

        // Emit the storyRentStatusUpdated event
        emit storyRentStatusUpdated(fileName, false);
    }

    // Function to rent a file
    function rentStory(string memory fileName) public {
        // Check if the file exists and renting is enabled
        require(bytes(storyName[fileName]).length > 0, "File does not exist");
        require(storyRentStatus[fileName], "Renting is not enabled for this file");

        // Set the renter
        storyRenters[fileName] = msg.sender;

        // Emit the FileRented event
        emit FileRented(fileName, msg.sender);
    }

    // Function to get the renter of a file
    function getStoryRenter(string memory fileName) public view returns (address) {
        return storyRenters[fileName];
    }
}
