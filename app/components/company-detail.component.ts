import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { ActivatedRoute, Params } from '@angular/router';

import { Company } from '../services/company';
import { CompanyService } from '../services/company.service';

@Component({
  moduleId: module.id,
  selector: 'my-company-detail',
  templateUrl: '../templates/company-detail.component.html'
})

export class CompanyDetailComponent implements OnInit {
  @Input() company: Company;
  @Output() close = new EventEmitter();
  error: any;
  navigated = false; // true if navigated here

  constructor(
    private companyService: CompanyService,
    private route: ActivatedRoute) {
  }

  ngOnInit(): void {
    this.route.params.forEach((params: Params) => {
      if (params['id'] !== undefined) {
        let id = +params['id'];
        this.navigated = true;
        this.companyService.getCompany(id)
          .then(company => this.company = company);
      } else {
        this.navigated = false;
        this.company = new Company();
      }
    });
  }

  save(): void {
    this.companyService
      .save(this.company)
      .then(company => {
        this.company = company; // saved company, w/ id if new
        this.goBack(company);
      })
      .catch(error => this.error = error); // TODO: Display error message
  }

  goBack(savedCompany: Company = null): void {
    this.close.emit(savedCompany);
    if (this.navigated) { window.history.back(); }
  }
}
