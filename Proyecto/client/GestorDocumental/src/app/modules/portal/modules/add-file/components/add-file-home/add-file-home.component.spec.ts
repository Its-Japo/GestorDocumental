import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AddFileHomeComponent } from './add-file-home.component';

describe('AddFileHomeComponent', () => {
  let component: AddFileHomeComponent;
  let fixture: ComponentFixture<AddFileHomeComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [AddFileHomeComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(AddFileHomeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
