public class LeadNotificationHelper {
    @InvocableMethod
    public static void sendNotification(List<Id> leadIds) {
        for (Lead lead : [SELECT Id, Owner.Email FROM Lead WHERE Id IN :leadIds]) {
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setToAddresses(new String[] {lead.Owner.Email});
            email.setSubject('Nouveau lead attribué');
            email.setPlainTextBody('Un nouveau lead vous a été attribué. Consultez-le dans Salesforce.');
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
        }
    }
}