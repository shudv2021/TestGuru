import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
//=require jquery3
//=require popper
import "./utilites/sorting"
import "./utilites/password_highlighting"
import './utilites/form_inline'
import './utilites/progress_bar'
import './utilites/timer'


Rails.start()
Turbolinks.start()
ActiveStorage.start()


/*

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage")
require("channels")
*/
