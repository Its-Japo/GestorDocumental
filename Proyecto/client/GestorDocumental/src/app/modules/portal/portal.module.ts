import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { PortalRoutingModule } from './portal-routing.module';

import { FrameComponent } from './components/frame/frame.component';
import { SearchComponent } from './components/search/search.component';


@NgModule({
  declarations: [
    FrameComponent,
    SearchComponent
  ],
  imports: [
    CommonModule,
    PortalRoutingModule
  ]
})
export class PortalModule { }
