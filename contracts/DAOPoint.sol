/*
 * SPDX-License-Identifier: MIT
 * Midpoint Sample Contract v2.0.0
 *
 * This is a contract generated at 2022-11-05 18:40:07 for making requests to and receiving responses from midpoint 414. 
 * For more information on setting up a midpoint and using this contract see docs.midpointapi.com
 */

pragma solidity>=0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

interface IMidpoint {
    function callMidpoint(uint64 midpointId, bytes calldata _data) external returns(uint256 requestId);
}

contract DAOPoint is Ownable{
    // These events are for demonstration purposes only; they can be removed without effect.
    event getBansRequestMade(uint256 requestId, string SERVER_ID);
    event kickRequestMade(uint256 requestId, string SERVER_ID, string USER_ID);
    event banRequestMade(uint256 requestId, string SERVER_ID, string USER_ID);
    event unBanRequestMade(uint256 requestId, string SERVER_ID, string USER_ID);
    event createRoleRequestMade(uint256 requestId, string SERVER_ID, string ROLE_NAME, string ROLE_COLOR);
    event addRoleRequestMade(uint256 requestId, string SERVER_ID, string USER_ID, string ROLE_ID);
    event removeRoleRequestMade(uint256 requestId, string SERVER_ID, string USER_ID, string ROLE_ID);
    event createChannelRequestMade(uint256 requestId, string SERVER_ID, string CHANNEL_NAME, string CHANNEL_TYPE, string CHANNEL_TOPIC);
    event ResponseReceived(uint256 requestId);
    
    address constant startpointAddress = 0x47a4905D4C2Eabd58abBDFEcBaeB07F1A29b660c; // midpoint's mumbai address
    address constant whitelistedCallbackAddress = 0xC0FFEE4a3A2D488B138d090b8112875B90b5e6D9;
    
    string SERVER_ID;
    // Midpoint ID
    uint64 constant getBansMidpointID = 409;
    uint64 constant kickMidpointID = 394;
    uint64 constant banMidpointID = 414;
    uint64 constant unBanMidpointID = 434;
    uint64 constant createRoleMidpointID = 413;
    uint64 constant addRoleMidpointID = 441;
    uint64 constant removeRoleMidpointID = 442;
    uint64 constant createChannelMidpointID = 419;


    constructor (address governor, string memory _serverID) {
      transferOwnership(governor);
      SERVER_ID = _serverID;
    }

    /*
     * This function makes a call to a midpoint with on-chain variables specified as function inputs. 
     * 
     * Note that this is a public function and will allow any address or contract to call midpoint 414.
     * The contract whitelist permits this entire contract to call your midpoint; calls to 'callMidpoint'
     * must be additionally restricted to intended callers.
     * Any call to 'callMidpoint' from a whitelisted contract will make a call to the midpoint;
     * there may be multiple places in this contract that call the midpoint or multiple midpoints called by the same contract.
     */ 

    function getBans() public onlyOwner {
        
        // Argument String
        bytes memory args = abi.encodePacked(SERVER_ID, bytes1(0x00));
        
        // Call Your Midpoint
        uint256 requestId = IMidpoint(startpointAddress).callMidpoint(getBansMidpointID, args);

        // For Demonstration Purposes Only
        emit getBansRequestMade(requestId, SERVER_ID);
    }

    function kickUser(string memory USER_ID) public onlyOwner {
        
        // Argument String
        bytes memory args = abi.encodePacked(SERVER_ID, bytes1(0x00), USER_ID, bytes1(0x00));
        
        // Call Your Midpoint
        uint256 requestId = IMidpoint(startpointAddress).callMidpoint(kickMidpointID, args);

        // For Demonstration Purposes Only
        emit kickRequestMade(requestId, SERVER_ID, USER_ID);
    }


    function banUser(string memory USER_ID) public onlyOwner {
        
        // Argument String
        bytes memory args = abi.encodePacked(SERVER_ID, bytes1(0x00), USER_ID, bytes1(0x00));
        
        // Call Your Midpoint
        uint256 requestId = IMidpoint(startpointAddress).callMidpoint(banMidpointID, args);

        // For Demonstration Purposes Only
        emit banRequestMade(requestId, SERVER_ID, USER_ID);
    }

     function unBanUser(string memory USER_ID) public onlyOwner {
        
        // Argument String
        bytes memory args = abi.encodePacked(SERVER_ID, bytes1(0x00), USER_ID, bytes1(0x00));
        
        // Call Your Midpoint
        uint256 requestId = IMidpoint(startpointAddress).callMidpoint(unBanMidpointID, args);

        // For Demonstration Purposes Only
        emit unBanRequestMade(requestId, SERVER_ID, USER_ID);
    }

    function CreateRole(string memory ROLE_NAME, string memory ROLE_COLOR) public onlyOwner {
        
        // Argument String
        bytes memory args = abi.encodePacked(ROLE_NAME, bytes1(0x00), ROLE_COLOR, bytes1(0x00), SERVER_ID, bytes1(0x00));
        
        // Call Your Midpoint
        uint256 requestId = IMidpoint(startpointAddress).callMidpoint(createRoleMidpointID, args);

        // For Demonstration Purposes Only
        emit createRoleRequestMade(requestId, SERVER_ID, ROLE_NAME, ROLE_COLOR);
    }

    function AddRole(string memory USER_ID, string memory ROLE_ID) public onlyOwner {
        
        // Argument String
        bytes memory args = abi.encodePacked(SERVER_ID, bytes1(0x00), USER_ID, bytes1(0x00), ROLE_ID, bytes1(0x00));
        
        // Call Your Midpoint
        uint256 requestId = IMidpoint(startpointAddress).callMidpoint(addRoleMidpointID, args);

        // For Demonstration Purposes Only
        emit addRoleRequestMade(requestId, SERVER_ID, USER_ID, ROLE_ID);
    }

    function RemoveRole(string memory USER_ID, string memory ROLE_ID) public onlyOwner {
        
        // Argument String
        bytes memory args = abi.encodePacked(SERVER_ID, bytes1(0x00), USER_ID, bytes1(0x00), ROLE_ID, bytes1(0x00));
        
        // Call Your Midpoint
        uint256 requestId = IMidpoint(startpointAddress).callMidpoint(removeRoleMidpointID, args);

        // For Demonstration Purposes Only
        emit removeRoleRequestMade(requestId, SERVER_ID, USER_ID, ROLE_ID);
    }

    function CreateChannel(string memory CHANNEL_NAME, string memory CHANNEL_TYPE, string memory CHANNEL_TOPIC) public onlyOwner {
        
        // Argument String
        bytes memory args = abi.encodePacked(SERVER_ID, bytes1(0x00), USER_ID, bytes1(0x00));
        
        // Call Your Midpoint
        uint256 requestId = IMidpoint(startpointAddress).callMidpoint(createChannelMidpointID, args);

        // For Demonstration Purposes Only
        emit createChannelRequestMade(requestId, SERVER_ID, CHANNEL_NAME, CHANNEL_TYPE, CHANNEL_TOPIC);
    }    
    
    
   /*
    * This function is the callback target specified in the prebuilt function in the midpoint response workflow. 
    * The callback does not need to be defined in the same contract as the request.
    */

   function callback(uint256 _requestId, uint64 _midpointId) public {
       // Only allow the verified callback address to submit information for your midpoint.
       require(tx.origin == whitelistedCallbackAddress, "Invalid callback address");
       //require(midpointID == _midpointId, "Invalid Midpoint ID");

       // Your callback function here
       
       // For Demonstration Purposes Only
       emit ResponseReceived(_requestId);
   }
}