// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TodaList {
    struct Todo {
        string text;
        bool completed;
    }

    Todo[] public todos;

    function create(string calldata _text) external {
        todos.push(Todo({
            text: _text,
            completed: false
        }));
    }

    function updateText(uint _index, string calldata _text) external {
        // 35138 gas => access state variable 4 times 
        todos[_index].text = _text;
        todos[_index].text = _text;
        todos[_index].text = _text;
        todos[_index].text = _text;

        // 34578 gas => access state variable 1 time
        Todo storage todo = todos[_index];
        todo.text = _text;
        todo.text = _text;
        todo.text = _text;
        todo.text = _text;
    }

    function get(uint _index) external view returns (string memory, bool){
        Todo memory todo = todos[_index];
        return (todo.text, todo.completed);
        // return (todos[_index].text, todos[_index].completed);
    }

    function toggleCompleted(uint _index) external {
        todos[_index].completed = !todos[_index].completed;
    }
}