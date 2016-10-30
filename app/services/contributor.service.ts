import { Injectable } from '@angular/core';
import { Headers, Http, Response } from '@angular/http';

import { Contributor } from './contributor';

@Injectable()
export class ContributorService {
  private contributorsUrl = '/api/contributors/';  // URL to web ap
  private contributors : Promise<Contributor[]> = null;

  constructor(private http: Http) { }

  getContributors(): Promise<Contributor[]> {
    if ( this.contributors === null) {
      this.contributors = this.http
            .get(this.contributorsUrl)
            .toPromise()
            .then(response => response.json() as Contributor[])
            .catch(this.handleError);
    }
    return this.contributors;
  }

  getContributor(id: number): Promise<Contributor> {
    return this.getContributors()
      .then(contributors => contributors.find(contributor => contributor.id === id));
  }

  private handleError(error: any): Promise<any> {
    console.error('An error occurred', error);
    return Promise.reject(error.message || error);
  }
}
