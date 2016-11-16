import {Component, Input, OnInit, OnChanges} from '@angular/core';

import { Company } from '../services/company';
import { CompanyService } from '../services/company.service';

@Component({
    moduleId: module.id,
    selector: 'my-company-search',
    templateUrl: '../templates/company-search.component.html'
})

export class CompanySearchComponent implements OnChanges {
    @Input() tokens: string[];
    @Input() or_search: boolean = false;
    companies: Company[] = [];

    constructor(
        private companyService: CompanyService) {
    }

    ngOnChanges(): void {
        this.companyService.searchCompanies(this.tokens, this.or_search)
            .then(companies => this.companies = companies);
    }
}