/*
 * SPDX-License-Identifier: MIT
 * Midpoint Sample Contract v2.0.0
 *
 * This is a contract generated at 2022-11-05 17:59:47 for making requests to and receiving responses from midpoint 374. 
 * For more information on setting up a midpoint and using this contract see docs.midpointapi.com
 */

pragma solidity>=0.8.0;

interface IMidpoint {
    function callMidpoint(uint64 midpointId, bytes calldata _data) external returns(uint256 requestId);
}

contract SampleContract {
    // These events are for demonstration purposes only; they can be removed without effect.
    event RequestMade(uint256 requestId, string SERVER_ID, string USER_ID);
    event ResponseReceived(uint256 requestId, int32 Status, string Banned_User);
    
    address constant startpointAddress = 0x0000000000000000000000000000000000000000;
    address constant whitelistedCallbackAddress = 0xC0FFEE4a3A2D488B138d090b8112875B90b5e6D9;
    
    // Midpoint ID
    uint64 constant midpointID = 374;

    constructor () {
      
    }

    /*
     * This function makes a call to a midpoint with on-chain variables specified as function inputs. 
     * 
     * Note that this is a public function and will allow any address or contract to call midpoint 374.
     * The contract whitelist permits this entire contract to call your midpoint; calls to 'callMidpoint'
     * must be additionally restricted to intended callers.
     * Any call to 'callMidpoint' from a whitelisted contract will make a call to the midpoint;
     * there may be multiple places in this contract that call the midpoint or multiple midpoints called by the same contract.
     */ 

    function callMidpoint(string memory SERVER_ID, string memory USER_ID) public {
        
        // Argument String
        bytes memory args = abi.encodePacked(SERVER_ID, bytes1(0x00), USER_ID, bytes1(0x00));
        
        // Call Your Midpoint
        uint256 requestId = IMidpoint(startpointAddress).callMidpoint(midpointID, args);

        // For Demonstration Purposes Only
        emit RequestMade(requestId, SERVER_ID, USER_ID);
    }
    
   /*
    * This function is the callback target specified in the prebuilt function in the midpoint response workflow. 
    * The callback does not need to be defined in the same contract as the request.
    */

   function callback(uint256 _requestId, uint64 _midpointId, int32 Status, string memory Banned_User) public {
       // Only allow the verified callback address to submit information for your midpoint.
       require(tx.origin == whitelistedCallbackAddress, "Invalid callback address");
       require(midpointID == _midpointId, "Invalid Midpoint ID");

       // Your callback function here
       
       // For Demonstration Purposes Only
       emit ResponseReceived(_requestId, Status, Banned_User);
   }
}