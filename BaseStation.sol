pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import "GameObject.sol";

contract BaseStation is GameObject {
    
    address [] ArrayUnit;
    
    // при деплои у базы сила защиты равна 10
    constructor() public {
        getPowerProtection(5);
    }
        
    //добавить юнита в базу
    function addUnit (address unitAddress) public {
       tvm.accept();
       ArrayUnit.push(unitAddress);
    }
      
    //удалить юнит из базы
    function deleteUnit (address unitAddress) public {
       tvm.accept();
       for (uint i = 0; i<=ArrayUnit.length-1; i++){
           if (ArrayUnit[i] == unitAddress){
       delete ArrayUnit[i];}
       }
    }

    // просмотр юнитов в базе
    function viewUnit() public view returns(address[]){
        tvm.accept();
        return ArrayUnit;
    }

    // смерть базы и юнитов
    function deathBase(GameObject unitAddress1, GameObject unitAddress2) public {
        tvm.accept();
        require(unitAddress1 == ArrayUnit[0] || unitAddress1 == ArrayUnit[0], 404);
        require(unitAddress2 == ArrayUnit[0] || unitAddress1 == ArrayUnit[0], 404);
        unitAddress1.kill();
        unitAddress2.kill();
        this.kill();
    }

    
       
}