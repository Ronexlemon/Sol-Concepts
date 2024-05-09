// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract PriceFeed {
    function latestRoundData() public view
    returns (
        uint80 roundId,
        int256 answer,
        uint256 startedAt,
        uint256 updatedAt,
        uint80 answeredInRound
    ) {
        // Add your logic here
        
        // For demonstration, returning default values
        return (0, 100, block.timestamp, block.timestamp, 0);
    }
}
