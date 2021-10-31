pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import "GameObject.sol";
import "BaseStation.sol";

contract MillitaryUnit is GameObject {
    
    uint myPowerAttack;

    address baseAddress;

    BaseStation base;

    // начать атаку
    function beginAttack (GameObject opponent, uint power) public {
        tvm.accept();
        if (power<=myPowerAttack){
        opponent.acceptAttack(power);
        myPowerAttack-=power;}
        else {
        opponent.acceptAttack(myPowerAttack);
        }
    }

    // получить силу атаки (обновляет данные)
    function getPowerAttack(uint powerAttack) virtual public {
        tvm.accept();
        myPowerAttack = powerAttack;
    } 

    // просмотри силы защиты
    function viewPowerAttack()public view returns(uint){
        tvm.accept();
        return myPowerAttack;
    }

    //смерть юнита
    function deathUnit () virtual public {
        tvm.accept();
        this.kill();
        base.deleteUnit(this);
    }

    
}