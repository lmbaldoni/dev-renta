/* tslint:disable:no-unused-variable */
import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { By } from '@angular/platform-browser';
import { DebugElement } from '@angular/core';

import { FootCompComponent } from './foot-comp.component';

describe('FootCompComponent', () => {
  let component: FootCompComponent;
  let fixture: ComponentFixture<FootCompComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ FootCompComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(FootCompComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
