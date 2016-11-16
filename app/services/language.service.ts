import { Injectable } from '@angular/core';
import { Headers, Http, Response } from '@angular/http';

import { Language } from './language';

@Injectable()
export class LanguageService {
  private languagesUrl = '/api/languages/';  // URL to web api
  private languageCountUrl = '/api/count/languages';  // URL to web api
  private languageSearchUrl = '/api/search/languages/'
  private languages :  Promise<Language[]> = null;

  constructor(private http: Http) { }

  getTotalLanguages() : Promise<number> {
    return this.http
        .get(this.languageCountUrl)
        .toPromise()
        .then(response => response.json() as number)
        .catch(this.handleError);
  }

  getLanguageRange(start:number, end:number): Promise<Language[]> {
    return this.http
        .get(this.languagesUrl + "?start=" + start +"&end=" + end)
        .toPromise()
        .then(response => response.json() as Language[])
        .catch(this.handleError);
  }

  getSortedLanguages(sortField:string, sortOrder:number, start:number, end:number) : Promise<Language[]> {
    if (sortOrder === 1) {
      return this.http
          .get(this.languagesUrl + "?start=" + start + "&end=" + end
              + "&orderby=" + sortField)
          .toPromise()
          .then(response => response.json() as Language[])
          .catch(this.handleError);

    } else if (sortOrder === -1) {
      return this.http
          .get(this.languagesUrl + "?start=" + start + "&end=" + end
              + "&orderby=" + sortField + "&descending=true")
          .toPromise()
          .then(response => response.json() as Language[])
          .catch(this.handleError);
    } else {
      return this.getLanguageRange(start, end);
    }
  }

  searchLanguages(tokens: string[], or_search:boolean): Promise<Language[]> {
    let url = this.languageSearchUrl + '?';
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
          .then(response => response.json() as Language[])
          .catch(this.handleError);
    }
    return null;
  }

  getLanguage(id: number): Promise<Language> {
    return this.http
        .get(this.languagesUrl + id)
        .toPromise()
        .then(response => response.json() as Language)
        .catch(this.handleError);
  }

  private handleError(error: any): Promise<any> {
    console.error('An error occurred', error);
    return Promise.reject(error.message || error);
  }
}
