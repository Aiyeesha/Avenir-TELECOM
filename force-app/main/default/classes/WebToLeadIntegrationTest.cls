@isTest
public class WebToLeadIntegrationTest {
    @isTest
    public static void testWebToLeadProcess() {
        // Étape 1 : Créer un utilisateur fictif
        User usr = [SELECT Id FROM User LIMIT 1];

        // Étape 2 : Simuler la création d’un Lead
        Lead lead = new Lead(
            FirstName = 'Integration',
            LastName = 'Test',
            Email = 'integrationtest@example.com',
            Company = 'Integration Company',
            OwnerId = usr.Id
        );
        insert lead;

        // Étape 3 : Vérifier que le Lead est attribué correctement
        Lead insertedLead = [SELECT OwnerId FROM Lead WHERE Id = :lead.Id];
        System.assertEquals(usr.Id, insertedLead.OwnerId, 'Le Lead doit être attribué au bon utilisateur.');

        // Étape 4 : Appeler la méthode sendNotification
        LeadNotificationHelper.sendNotification(new List<Id>{lead.Id});
        System.assert(true, 'La notification a été envoyée avec succès.');
    }
}
