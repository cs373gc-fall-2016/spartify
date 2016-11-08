import { Injectable } from '@angular/core';
import { Headers, Http, Response } from '@angular/http';

import 'rxjs/add/operator/toPromise';

import { Company } from './company';

@Injectable()
export class CompanyService {
  private companiesUrl = '/api/companies/';  // URL to web api.
  private companyCountUrl = '/api/count/companies/';  // URL to web api
  private companySearchUrl = '/api/search/companies/'
  private companies : Promise<Company[]> = null;

  constructor(private http: Http) { }

  getTotalCompanies() : Promise<number> {
    return this.http
        .get(this.companyCountUrl)
        .toPromise()
        .then(response => response.json() as number)
        .catch(this.handleError);
  }

  getCompanyRange(start:number, end:number): Promise<Company[]> {
    return this.http
        .get(this.companiesUrl + "?start=" + start +"&end=" + end)
        .toPromise()
        .then(response => response.json() as Company[])
        .catch(this.handleError);
  }

  getSortedCompanies(sortField:string, sortOrder:number, start:number, end:number) : Promise<Company[]> {
    if (sortOrder === 1) {
      return this.http
          .get(this.companiesUrl + "?start=" + start + "&end=" + end
              + "&orderby=" + sortField)
          .toPromise()
          .then(response => response.json() as Company[])
          .catch(this.handleError);

    } else if (sortOrder === -1) {
      return this.http
          .get(this.companiesUrl + "?start=" + start + "&end=" + end
              + "&orderby=" + sortField + "&descending=true")
          .toPromise()
          .then(response => response.json() as Company[])
          .catch(this.handleError);
    } else {
      return this.getCompanyRange(start, end);
    }
  }

  searchCompanies(tokens: string[]): Promise<Company[]> {
    let url = this.companySearchUrl + '?';
    if (tokens) {
      url = url + 'q=' + tokens[0];
      let i = 0;
      for (i = 1; i < tokens.length; i++) {
        url = url + '&q=' + tokens[i];
      }
      return this.http.get(url)
                 .toPromise()
                 .then(response => response.json() as Company[])
                 .catch(this.handleError);
    }
    return null;
  }

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
    return this.http
        .get(this.companiesUrl + id)
        .toPromise()
        .then(response => response.json() as Company)
        .catch(this.handleError);
  }

  private handleError(error: any): Promise<any> {
    console.error('An error occurred', error);
    return Promise.reject(error.message || error);
  }
}
