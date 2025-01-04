public class OpportunityPDFHelper {
    @AuraEnabled
    public static String generatePDF(Id opportunityId) {
        // Récupère les informations de l'opportunité
        Opportunity opp = [SELECT Name, Account.Name, Amount, CloseDate, StageName FROM Opportunity WHERE Id = :opportunityId];
        
        // Génère le contenu du PDF
        String pdfContent = 'Opportunity Details\n';
        pdfContent += '=====================\n';
        pdfContent += 'Opportunity Name: ' + opp.Name + '\n';
        pdfContent += 'Account Name: ' + (opp.Account != null ? opp.Account.Name : 'No Account') + '\n';
        pdfContent += 'Amount: ' + opp.Amount + '\n';
        pdfContent += 'Close Date: ' + opp.CloseDate + '\n';
        pdfContent += 'Stage: ' + opp.StageName + '\n';

        // Retourne le contenu généré
        return pdfContent;
    }
}