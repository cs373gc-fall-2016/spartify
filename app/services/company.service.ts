import { Injectable } from '@angular/core';
import { Headers, Http, Response } from '@angular/http';

import 'rxjs/add/operator/toPromise';

import { Company } from './company';

@Injectable()
export class CompanyService {
  private companiesUrl = '/api/companies';  // URL to web api

  constructor(private http: Http) { }

  getCompanies(): Promise<Company[]> {
    return this.http
      .get(this.companiesUrl)
      .toPromise()
      .then(response => response.json().data as Company[])
      .catch(this.handleError);
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
