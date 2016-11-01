import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

import { ProjectService } from "../services/project.service";
import { Project } from "../services/project";
import { LazyLoadEvent } from "primeng/components/common/api";

@Component({
  moduleId: module.id,
  selector: 'projects',
  templateUrl: '../templates/projects.component.html'
})

export class ProjectsComponent implements OnInit {
  totalProjects = 0;
  projects: Project[] = [];

  constructor(private router: Router,
              private projectService: ProjectService) {
  }

  ngOnInit(): void {
    this.projectService.getTotalProjects()
        .then(total => this.totalProjects = total)
    this.projectService.getProjectRange(0, 5)
      .then(projects => this.projects = projects);

  }

  loadData(event : LazyLoadEvent) {
    if (event.sortField) {
      this.projectService.getSortedProjects(event.sortField, event.sortOrder, event.first, (event.first + event.rows))
          .then(contributors => this.projects = contributors);
    } else {
      this.projectService.getProjectRange(event.first, (event.first + event.rows))
        .then(projects => this.projects = projects);
    }
  }
}
