import { Injectable } from '@angular/core';
import { Headers, Http, Response } from '@angular/http';

import { Language } from './language';

@Injectable()
export class LanguageService {
  private languagesUrl = '/api/languages/';  // URL to web api
  private languageCountUrl = '/api/count/languages';  // URL to web api
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

  getLanguages(): Promise<Language[]> {
    if (this.languages === null) {
      this.languages = this.http
          .get(this.languagesUrl)
          .toPromise()
          .then(response => response.json() as Language[])
          .catch(this.handleError);
    }
    return this.languages;
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
