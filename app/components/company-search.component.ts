import { Component, Input, OnInit } from '@angular/core';

import { Company } from '../services/company';
import { CompanyService } from '../services/company.service';

@Component({
    moduleId: module.id,
    selector: 'my-company-search',
    templateUrl: '../templates/company-search.component.html'
})

export class CompanySearchComponent implements OnInit {
    @Input() tokens: string[];
    companies: Company[] = [];

    constructor(
        private companyService: CompanyService) {
    }

    ngOnInit(): void {
        this.companyService.searchCompanies(this.tokens)
            .then(companies => this.companies = companies);
    }
}