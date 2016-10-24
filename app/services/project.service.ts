import { Injectable } from '@angular/core';
import { Headers, Http, Response } from '@angular/http';

import { Project } from './project';

@Injectable()
export class ProjectService {
  private projectsUrl = '/api/projects';  // URL to web api

  constructor(private http: Http) { }

  getProjects(): Promise<Project[]> {
    return this.http
      .get(this.projectsUrl, { cache: true})
      .toPromise()
      .then(response => response.json().data as Project[])
      .catch(this.handleError);
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
