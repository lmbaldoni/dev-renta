/* tslint:disable:no-unused-variable */
import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { By } from '@angular/platform-browser';
import { DebugElement } from '@angular/core';

import { OutputCompComponent } from './output-comp.component';

describe('OutputCompComponent', () => {
  let component: OutputCompComponent;
  let fixture: ComponentFixture<OutputCompComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ OutputCompComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(OutputCompComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
