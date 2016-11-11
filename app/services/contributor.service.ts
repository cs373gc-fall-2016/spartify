import { Injectable } from '@angular/core';
import { Headers, Http, Response } from '@angular/http';

import { Contributor } from './contributor';

@Injectable()
export class ContributorService {
  private contributorsUrl = '/api/contributors/';  // URL to web ap
  private contributorCountUrl = '/api/count/contributors';  // URL to web api
  private contributorSearchUrl = '/api/search/contributors/'
  private contributors : Promise<Contributor[]> = null;

  constructor(private http: Http) { }

  getTotalContributors() : Promise<number> {
    return this.http
        .get(this.contributorCountUrl)
        .toPromise()
        .then(response => response.json() as number)
        .catch(this.handleError);
  }

  getContributorRange(start:number, end:number): Promise<Contributor[]> {
    return this.http
        .get(this.contributorsUrl + "?start=" + start +"&end=" + end)
        .toPromise()
        .then(response => response.json() as Contributor[])
        .catch(this.handleError);
  }

  getSortedContributors(sortField:string, sortOrder:number, start:number, end:number) : Promise<Contributor[]> {
    if (sortOrder === 1) {
      return this.http
          .get(this.contributorsUrl + "?start=" + start + "&end=" + end
              + "&orderby=" + sortField)
          .toPromise()
          .then(response => response.json() as Contributor[])
          .catch(this.handleError);

    } else if (sortOrder === -1) {
      return this.http
          .get(this.contributorsUrl + "?start=" + start + "&end=" + end
              + "&orderby=" + sortField + "&descending=true")
          .toPromise()
          .then(response => response.json() as Contributor[])
          .catch(this.handleError);
    } else {
      return this.getContributorRange(start, end);
    }
  }

  searchContributors(tokens: string[], or_search:boolean): Promise<Contributor[]> {
    let url = this.contributorSearchUrl + '?';
    if (tokens) {
      url = url + 'q=' + tokens[0];
      let i = 0;
      for (i = 1; i < tokens.length; i++) {
        url = url + '&q=' + tokens[i];
      }
      if (or_search) {
        url = url + "&type=or"
      }
      return this.http.get(url)
          .toPromise()
          .then(response => response.json() as Contributor[])
          .catch(this.handleError);
    }
    return null;
  }

  getContributor(id: number): Promise<Contributor> {
    return this.http
        .get(this.contributorsUrl + id)
        .toPromise()
        .then(response => response.json() as Contributor)
        .catch(this.handleError);
  }

  private handleError(error: any): Promise<any> {
    console.error('An error occurred', error);
    return Promise.reject(error.message || error);
  }
}
