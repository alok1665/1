public class UniqueEmailCheckHandler {
    public static void checkLeadEmail (List<Lead> leadList) {
        Set<String> emailSet = new Set<String> ();
        for (Lead aLead : leadList) {
            if (aLead.Email != null)
                emailSet.add (aLead.Email);
        } // End for

        Set<String> existEmailSet = new Set<String> ();
        for (Lead leadExist : [SELECT Id, Email
                                FROM Lead
                                WHERE Email IN :emailSet]) {
            existEmailSet.add (leadExist.Email);
        } // End for

        for (Lead lead : leadList) {
            if (existEmailSet.contains (lead.Email))
                lead.Email.addError ('Duplicate Email!');
        }
    }
}