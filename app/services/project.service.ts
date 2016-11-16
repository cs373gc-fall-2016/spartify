import { Injectable } from '@angular/core';
import { Headers, Http, Response } from '@angular/http';

import { Project } from './project';

@Injectable()
export class ProjectService {
  private projectsUrl = '/api/projects/';  // URL to web api
  private projectCountUrl = '/api/count/projects';  // URL to web api
  private projectSearchUrl = '/api/search/projects/'

  private projects : Promise<Project[]>  = null;

  constructor(private http: Http) { }

  getTotalProjects() : Promise<number> {
    return this.http
        .get(this.projectCountUrl)
        .toPromise()
        .then(response => response.json() as number)
        .catch(this.handleError);
  }

  getProjectRange(start:number, end:number): Promise<Project[]> {
    return this.http
          .get(this.projectsUrl + "?start=" + start +"&end=" + end)
          .toPromise()
          .then(response => response.json() as Project[])
          .catch(this.handleError);
  }

  getSortedProjects(sortField:string, sortOrder:number, start:number, end:number) : Promise<Project[]> {
    if (sortOrder === 1) {
      return this.http
          .get(this.projectsUrl + "?start=" + start + "&end=" + end
              + "&orderby=" + sortField)
          .toPromise()
          .then(response => response.json() as Project[])
          .catch(this.handleError);

    } else if (sortOrder === -1) {
      return this.http
          .get(this.projectsUrl + "?start=" + start + "&end=" + end
              + "&orderby=" + sortField + "&descending=true")
          .toPromise()
          .then(response => response.json() as Project[])
          .catch(this.handleError);
    } else {
      return this.getProjectRange(start, end);
    }
  }

  searchProjects(tokens: string[], or_search:boolean): Promise<Project[]> {
    let url = this.projectSearchUrl + '?';
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
          .then(response => response.json() as Project[])
          .catch(this.handleError);
    }
    return null;
  }

  getProject(id: number): Promise<Project> {
      return this.http
          .get(this.projectsUrl + id)
          .toPromise()
          .then(response => response.json() as Project)
          .catch(this.handleError);
  }

  private handleError(error: any): Promise<any> {
    console.error('An error occurred', error);
    return Promise.reject(error.message || error);
  }
}
