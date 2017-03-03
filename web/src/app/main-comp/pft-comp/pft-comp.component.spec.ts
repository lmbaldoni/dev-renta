/* tslint:disable:no-unused-variable */
import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { By } from '@angular/platform-browser';
import { DebugElement } from '@angular/core';

import { PftCompComponent } from './pft-comp.component';

describe('PftCompComponent', () => {
  let component: PftCompComponent;
  let fixture: ComponentFixture<PftCompComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PftCompComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PftCompComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
