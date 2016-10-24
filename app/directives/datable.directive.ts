import {Directive, ElementRef} from '@angular/core';
import {Input, OnInit}         from '@angular/core';


import { JqueryDataTableEvent } from './jquery-datable-event';
import 'jquery.dataTables';

declare var jQuery:any;

@Directive({
  selector: '[jqueryDatatable]'
})

export class JqueryDatatableDirective implements OnInit {
  private _datatable : any;

  @Input()
  jqueryDatatable: any;

  @Input()
  dataTableEvents: JqueryDataTableEvent[];

  constructor(private _element: ElementRef) {}

  ngOnInit() {
    this.applyOptions();
    this.applyEvents();
  }

  applyOptions()
  {
    if (!this.jqueryDatatable)
      console.error("Empty options array was passed to initialize jqueryDatatable.");

    this._datatable = jQuery(this._element.nativeElement).DataTable( this.jqueryDatatable || {} );

  }

  applyEvents() {
    this.dataTableEvents.map((event)=> {
      this._datatable.on(event.eventName, event.selector, event.callback)
    });
  }
}
