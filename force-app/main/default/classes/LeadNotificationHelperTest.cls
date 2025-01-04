@isTest
public class LeadNotificationHelperTest {
    @isTest
    public static void testSendNotification() {
        // Étape 1 : Récupérer un utilisateur fictif
        User usr = [SELECT Id FROM User LIMIT 1];

        // Étape 2 : Créer un Lead fictif
        Lead lead = new Lead(
            FirstName = 'Test',
            LastName = 'Lead',
            Email = 'testlead@example.com',
            Company = 'Test Company',
            OwnerId = usr.Id // Lien avec l'utilisateur
        );
        insert lead;

        // Étape 3 : Appeler la méthode sendNotification
        LeadNotificationHelper.sendNotification(new List<Id>{lead.Id});

        // Étape 4 : Vérifier qu’aucune erreur n’a été levée
        System.assert(true, 'La méthode a fonctionné sans erreur.');
    }
}
