import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { LazyLoadEvent } from "primeng/components/common/api";

import { Company } from '../services/company';
import { CompanyService } from '../services/company.service';

@Component({
  moduleId: module.id,
  selector: 'companies',
  templateUrl: '../templates/companies.component.html'
})

export class CompaniesComponent implements OnInit {
  totalCompanies = 0;
  companies: Company[] = [];

  constructor(
    private router: Router,
    private companyService: CompanyService) {
  }

  ngOnInit(): void {
    this.companyService.getTotalCompanies()
        .then(total => this.totalCompanies = total)
    this.companyService.getCompanyRange(0, 5)
      .then(companies => this.companies = companies);
  }

  loadData(event : LazyLoadEvent) {
    if (event.sortField) {
      this.companyService.getSortedCompanies(event.sortField, event.sortOrder, event.first, (event.first + event.rows))
          .then(contributors => this.companies = contributors);
    } else {
      this.companyService.getCompanyRange(event.first, (event.first + event.rows))
          .then(contributors => this.companies = contributors);
    }
  }
}
