import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { ActivatedRoute, Params } from '@angular/router';

import { Project } from '../services/project';
import { ProjectService } from '../services/project.service';

@Component({
  moduleId: module.id,
  selector: 'my-project-detail',
  templateUrl: '../templates/project-detail.component.html'
})

export class ProjectDetailComponent implements OnInit {
  @Input() project: Project;
  @Output() close = new EventEmitter();
  error: any;
  navigated = false; // true if navigated here

  constructor(
    private projectService: ProjectService,
    private route: ActivatedRoute) {
  }

  ngOnInit(): void {
    this.route.params.forEach((params: Params) => {
      if (params['id'] !== undefined) {
        let id = +params['id'];
        this.navigated = true;
        this.projectService.getProject(id)
          .then(project => this.project = project);
      } else {
        this.navigated = false;
        this.project = new Project();
      }
    });
  }

  goBack(savedProject: Project = null): void {
    this.close.emit(savedProject);
    if (this.navigated) { window.history.back(); }
  }
}
