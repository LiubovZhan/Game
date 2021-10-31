pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import "MillitaryUnit.sol";

contract Warrior is MillitaryUnit{

    // загрузка юнита в базу
    // при деплои у Воина сила защиты 5, сила атаки 5
    constructor(BaseStation base) virtual public {
        tvm.accept();
        base.addUnit(this);
        baseAddress = base;
        getPowerProtection(5);
        getPowerAttack(5);
    }

        
}