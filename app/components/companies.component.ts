import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

import { Company } from '../services/company';
import { CompanyService } from '../services/company.service';

@Component({
  moduleId: module.id,
  selector: 'companies',
  templateUrl: '../templates/companies.component.html'
})

export class CompaniesComponent implements OnInit {
  companies: Company[] = [];

  constructor(
    private router: Router,
    private companyService: CompanyService) {
  }

  ngOnInit(): void {
    this.companyService.getCompanies()
      .then(companies => this.companies = companies);
  }
}
