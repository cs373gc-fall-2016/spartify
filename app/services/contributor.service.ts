import { Injectable } from '@angular/core';
import { Headers, Http, Response } from '@angular/http';

import { Contributor } from './contributor';

@Injectable()
export class ContributorService {
  private contributorsUrl = '/api/contributors/';  // URL to web api

  constructor(private http: Http) { }

  getContributors(): Promise<Contributor[]> {
    return this.http
      .get(this.contributorsUrl, { cache: true})
      .toPromise()
      .then(response => response.json().data as Contributor[])
      .catch(this.handleError);
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
