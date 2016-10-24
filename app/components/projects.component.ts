import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

import { ProjectService } from "../services/project.service";
import { Project } from "../services/project";

@Component({
  moduleId: module.id,
  selector: 'projects',
  templateUrl: '../templates/projects.component.html'
})

export class ProjectsComponent implements OnInit {
  projects: Project[] = [];

  constructor(private router: Router,
              private projectService: ProjectService) {
  }

  ngOnInit(): void {
    this.projectService.getProjects()
      .then(projects => this.projects = projects);
  }
}
