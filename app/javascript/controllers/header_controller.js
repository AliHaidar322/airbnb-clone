import { Controller } from "@hotwired/stimulus"
import {enter, leave, toggle} from 'el-transition'

export default class extends Controller {
  static targets = ['dropdown', 'mobileDropdown'];

  dropdownToggle(){
    toggle(this.dropdownTarget);
  }

  mobileDropdownToggle(){
    toggle(this.mobileDropdownTarget);
  }
}
