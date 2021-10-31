pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import "MillitaryUnit.sol";

contract  Archer is MillitaryUnit {

    // загрузка юнита в базу
    // при деплои у Воина сила защиты 6, сила атаки 6
    constructor(BaseStation base) virtual public {
        tvm.accept();
        base.addUnit(this);
        baseAddress = base;
        getPowerProtection(6);
        getPowerAttack(6);
    }    
    
}
