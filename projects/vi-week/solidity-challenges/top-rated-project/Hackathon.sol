// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Hackathon {
    struct Project {
        string title;
        uint256[] ratings;
    }

    Project[] projects;

    // TODO: add the findWinner function
    function findWinner() external view returns (Project memory project) {
        // Find Average Rating
        uint256 maxRating = 0;
        uint256 maxRatingIndex = 0;

        for (uint256 i = 0; i < projects.length; i++) {
            uint256 sum = 0;
            for (uint256 j = 0; j < projects[i].ratings.length; j++) {
                sum += projects[i].ratings[j];
            }
            uint256 avg = sum / projects[i].ratings.length;
            if (avg > maxRating) {
                maxRating = avg;
                maxRatingIndex = i;
            }
        }

        return projects[maxRatingIndex];
    }

    function newProject(string calldata _title) external {
        // creates a new project with a title and an empty ratings array
        projects.push(Project(_title, new uint256[](0)));
    }

    function rate(uint256 _idx, uint256 _rating) external {
        // rates a project by its index
        projects[_idx].ratings.push(_rating);
    }
}
