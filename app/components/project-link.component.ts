import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { ActivatedRoute, Params } from '@angular/router';

import { Project } from '../services/project';
import { ProjectService } from '../services/project.service';

@Component({
  moduleId: module.id,
  selector: 'my-project-link',
  templateUrl: '../templates/project-link.component.html'
})

export class ProjectLinkComponent implements OnInit {
  @Input() p_id: number;
  @Input() project: Project;

  constructor(
    private projectService: ProjectService,
    private route: ActivatedRoute) {
  }

  ngOnInit(): void {
      this.projectService.getProject(this.p_id)
        .then(project => this.project = project);
  }
}
