// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Enum {
    enum Status {
        None,
        Pending,
        Shipped,
        Completed,
        Rejected,
        Canceled
    }

    Status public order1 = Status.Canceled;
    Status public order2 = Status.Pending;
    Status public order3 = Status.Canceled;
    Status public order4 = Status.Pending;
    Status public order5 = Status.Canceled;
    Status public order6 = Status.Pending;
    Status public order7 = Status.Canceled;
    Status public order8 = Status.Pending;
    Status public order9 = Status.Canceled;
    Status public order10 = Status.Pending;
    Status public order11 = Status.Canceled;
    Status public order12 = Status.Pending;
    Status public order13 = Status.Canceled;
    Status public order14 = Status.Pending;
    Status public order15 = Status.Canceled;
    Status public order16 = Status.Pending;

}