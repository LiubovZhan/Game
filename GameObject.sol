pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import "InterfaceGameObject.sol";

contract GameObject is InferfaceGameObject {
    
    uint attack;
    uint protection;
    address opponentAddress;
    uint lives = 5;
    string message;
    
    //получить силу защиты (обновляет данные)
    function getPowerProtection(uint powerProtection) virtual public {
        tvm.accept();
        protection = powerProtection;
    }

    //принять атаку
    function acceptAttack (uint power) external override {
        tvm.accept();
        attack = power;
        if (attack>protection){
            lives-=1;
            protection = 0;
        } else {
            protection -= attack;
        }
        opponentAddress = msg.sender;
        checkAttack();
    }

    //проверка статуса игры
    function checkAttack () private {
        tvm.accept();
        if (lives == 0){
            message = "Вы проиграли";
        }
        else{
            message = "Игра продолжается";
        }
    }

    //вывод статуса игры
    function statusAttack() public view returns(string){
        tvm.accept();
        return message;
    }

    //просмотр силы защиты
    function viewPowerProtection () public view returns(uint){
        tvm.accept();
        return protection;
    }

    //функция самоуничтожения
    function kill () external {
        tvm.accept();
        selfdestruct(opponentAddress);
    }
 
}
