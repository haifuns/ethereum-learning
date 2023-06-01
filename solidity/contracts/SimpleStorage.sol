// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18; // >=0.8.18

// 定义合约
contract SimpleStorage {
    // Types: boolean, uint uint256, int, address, bytes

    uint256 public favoriteNumber;

    People[] public persons;

    mapping(string => uint256) public nameToFavoriteNumber;

    struct People {
        uint256 favoriteNumber;
        string name;
    }

    // Function
    function store(uint256 _favoriteNumber) public virtual {
        favoriteNumber = _favoriteNumber;
        //retrieve(); // 消耗gas
    }

    // view 只读, pure 只读、并且不能读取区块链数据，不需要消耗gas，在其他函数内调用除外
    function retrieve() public view returns (uint256) {
        return favoriteNumber;
    }

    // 数据存储方式，用于数组、结构和映射
    // 1. Stack
    // 2. Memory, 临时可修改
    // 3. Storage, 永久变量
    // 4. Calldata, 临时不可修改
    // 5. Code
    // 6. Logs
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        persons.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}
