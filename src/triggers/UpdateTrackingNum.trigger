/**
 * Description: Add your detailed comment
 *
 * Created By: Siddharth Pandit
 * Created Date: 11/11/2017
 **/
trigger UpdateTrackingNum on Opportunity (before insert) {
    Integer opptyExist = [SELECT COUNT ()
                            FROM Opportunity];
    for (Opportunity oppty : Trigger.new) {
        opptyExist ++;
        oppty.TrackingNumber__c = 'TN-alok00' +opptyExist;
    }
}