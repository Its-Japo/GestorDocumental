import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { FrameComponent } from './components/frame/frame.component';

const routes: Routes = [
  {
    path: '',
    component: FrameComponent,
    children: [
      {
        path: 'search', // Esta ruta ahora cargará el módulo 'search' de manera perezosa
        loadChildren: () => import('./modules/search/search.module').then(m => m.SearchModule)
      },
      // otras sub-rutas que también se mostrarán dentro de Frame
    ]
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class PortalRoutingModule { }

