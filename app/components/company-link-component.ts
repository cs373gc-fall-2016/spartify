import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { ActivatedRoute, Params } from '@angular/router';

import { Company } from '../services/company';
import { CompanyService } from '../services/company.service';

@Component({
  moduleId: module.id,
  selector: 'my-company-link',
  templateUrl: '../templates/company-link.component.html'
})

export class CompanyLinkComponent implements OnInit {
  @Input() c_id: number;
  @Input() company: Company;

  constructor(
    private companyService: CompanyService,
    private route: ActivatedRoute) {
  }

  ngOnInit(): void {
    this.companyService.getCompany(this.c_id)
      .then(company => this.company = company);
  }
}
