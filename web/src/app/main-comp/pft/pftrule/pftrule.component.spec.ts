/* tslint:disable:no-unused-variable */
import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { By } from '@angular/platform-browser';
import { DebugElement } from '@angular/core';

import { PftruleComponent } from './pftrule.component';

describe('PftruleComponent', () => {
  let component: PftruleComponent;
  let fixture: ComponentFixture<PftruleComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PftruleComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PftruleComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
