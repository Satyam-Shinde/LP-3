// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentManagement {
    struct Student {
        uint stud_id;
        string name;
        string department;
    }

    Student[] public students;

    // Add Student
    function addStudent(
        uint stud_id,
        string memory name,
        string memory department
    ) public {
        students.push(Student(stud_id, name, department));
    }

    // Get Student Data by ID
    function getStudent(
        uint stud_id
    ) public view returns (string memory, string memory) {
        for (uint i = 0; i < students.length; i++) {
            if (students[i].stud_id == stud_id) {
                return (students[i].name, students[i].department);
            }
        }
        return ("Not Found", "Not Found");
    }

    // Fallback Function
    // When contract receives ETH or an unknown function call
    fallback() external payable {
        // We'll auto add a default "Unknown" student entry
        students.push(Student(9999, "Unknown", "Undefined"));
    }

    // Optional: Receive Ether function (if someone sends plain ETH)
    receive() external payable {
        // Do nothing or log
    }
}
