import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { MembersCmpComponent } from './members-cmp.component';

describe('MembersCmpComponent', () => {
  let component: MembersCmpComponent;
  let fixture: ComponentFixture<MembersCmpComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MembersCmpComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(MembersCmpComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should be created', () => {
    expect(component).toBeTruthy();
  });
});
