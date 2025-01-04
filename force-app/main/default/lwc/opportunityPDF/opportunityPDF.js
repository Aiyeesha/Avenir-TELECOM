import generatePDF from '@salesforce/apex/OpportunityPDFHelper.generatePDF';
import { LightningElement, api } from 'lwc';

export default class OpportunityPDF extends LightningElement {
    @api recordId; // ID de l'opportunité sélectionnée
    pdfContent;
    error;

    handleGeneratePDF() {
        generatePDF({ opportunityId: this.recordId })
            .then(result => {
                this.pdfContent = result;
                this.error = undefined;
            })
            .catch(error => {
                this.error = error.body.message;
                this.pdfContent = undefined;
            });
    }
}
