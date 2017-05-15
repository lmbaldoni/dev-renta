/* tslint:disable:no-unused-variable */
import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { By } from '@angular/platform-browser';
import { DebugElement } from '@angular/core';

import { BatchExecutionCompComponent } from './batch-execution-comp.component';

describe('BatchExecutionCompComponent', () => {
  let component: BatchExecutionCompComponent;
  let fixture: ComponentFixture<BatchExecutionCompComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ BatchExecutionCompComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(BatchExecutionCompComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
