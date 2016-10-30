import { Injectable } from '@angular/core';
import { Headers, Http, Response } from '@angular/http';

import { Project } from './project';

@Injectable()
export class ProjectService {
  private projectsUrl = '/api/projects/';  // URL to web api
  private projects : Promise<Project[]>  = null;

  constructor(private http: Http) { }

  getProjects(): Promise<Project[]> {
    if (this.projects === null) {
      this.projects =  this.http
        .get(this.projectsUrl)
        .toPromise()
        .then(response => response.json() as Project[])
        .catch(this.handleError);
    }
    return this.projects;
  }

  getProject(id: number): Promise<Project> {
    return this.getProjects()
      .then(projects => projects.find(project => project.id === id));
  }

  private handleError(error: any): Promise<any> {
    console.error('An error occurred', error);
    return Promise.reject(error.message || error);
  }
}
