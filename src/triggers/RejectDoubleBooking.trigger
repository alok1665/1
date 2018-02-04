trigger RejectDoubleBooking on Session_Speaker__c (before insert, before update) {
    list <Id> speakerIds= new List <Id>();
    map<Id, DateTime > requested_bookings = new map<Id, DateTime>();
    for(Session_Speaker__c newItem : Trigger.new){
        requested_bookings.put(newItem.Session__c, Null);
            speakerIds.add(newItem.Speaker__c);
    }
    List<Session__c> related_sessions = [SELECT ID, Session_Date__c from Session__c 
                                         WHERE ID IN :requested_bookings.keySet()];
    for(Session__c related_session : related_sessions)
    {
          requested_bookings.put(related_session.Id,related_session.Session_Date__c);
    }
	List <Session_speaker__c> related_speakers = [SELECT ID, Speaker__c, 
                                                  Session__c, Session__r.Session_Date__c
                                                  from Session_Speaker__c WHERE Speaker__c IN :speakerIds];
    for(Session_Speaker__c requested_session_speaker : Trigger.new)
    {
        DateTime Booking_Time =  requested_bookings.get(requested_session_speaker.Session__c);
        for(Session_Speaker__c related_speaker : related_speakers) {
            if(related_speaker.Speaker__c == requested_session_speaker.Speaker__c &&
               related_speaker.Session__r.Session_Date__c == booking_time) {
                   requested_session_speaker.addError('The speaker is already booked at that time');
               }
        }
    }

}