import { Injectable } from '@angular/core';
import { Headers, Http, Response } from '@angular/http';

import 'rxjs/add/operator/toPromise';

import { Company } from './company';

@Injectable()
export class CompanyService {
  private companiesUrl = '/api/companies/';  // URL to web api
  private companies : Promise<Company[]> = null;

  constructor(private http: Http) { }

  getCompanies(): Promise<Company[]> {
    if (this.companies === null) {
      this.companies = this.http
          .get(this.companiesUrl)
          .toPromise()
          .then(response => response.json() as Company[])
          .catch(this.handleError);
    }
    return this.companies;
  }

  getCompany(id: number): Promise<Company> {
    return this.getCompanies()
      .then(companies => companies.find(company => company.id === id));
  }

  private handleError(error: any): Promise<any> {
    console.error('An error occurred', error);
    return Promise.reject(error.message || error);
  }
}
