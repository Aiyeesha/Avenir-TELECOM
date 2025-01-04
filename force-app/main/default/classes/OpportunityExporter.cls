/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 12-27-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class OpportunityExporter {
    public static void exportOpportunities() {
        // Récupérer les opportunités dans Salesforce
        List<Opportunity> opportunities = [SELECT Name, CloseDate FROM Opportunity];

        // Construire un contenu CSV
        String csvContent = 'Name,CloseDate\n';
        for (Opportunity opp : opportunities) {
            csvContent += opp.Name + ',' + opp.CloseDate + '\n';
        }

        // Simuler l'envoi vers un serveur SFTP (affichage dans les logs)
        System.debug('Exporting to SFTP: ' + csvContent);
    }
}