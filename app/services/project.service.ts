import { Injectable } from '@angular/core';
import { Headers, Http, Response } from '@angular/http';

import { Project } from './project';

@Injectable()
export class ProjectService {
  private projectsUrl = '/api/projects/';  // URL to web api
  private projectCountUrl = '/api/count/projects';  // URL to web api

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
