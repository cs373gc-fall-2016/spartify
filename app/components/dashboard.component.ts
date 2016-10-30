import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

import { Company } from '../services/company';
import { CompanyService } from '../services/company.service';

@Component({
  moduleId: module.id,
  selector: 'my-splash',
  templateUrl: '../templates/splash.component.html'
})
export class SplashComponent implements OnInit {
  count = 0;
  companies: Company[] = [];

  constructor(
    private router: Router,
    private companyService: CompanyService) {
  }

  ngOnInit(): void {
    this.companyService.getCompanies()
      .then(companies => this.companies = companies);
  }

  isActive() {
    if (this.count === 0) {
      this.count = 1;
      return true;
    } else {
      return false;
    }
  }
}
