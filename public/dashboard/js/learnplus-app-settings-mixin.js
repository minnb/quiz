!function(t){var e={};function a(r){if(e[r])return e[r].exports;var n=e[r]={i:r,l:!1,exports:{}};return t[r].call(n.exports,n,n.exports,a),n.l=!0,n.exports}a.m=t,a.c=e,a.d=function(t,e,r){a.o(t,e)||Object.defineProperty(t,e,{enumerable:!0,get:r})},a.r=function(t){"undefined"!=typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(t,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(t,"__esModule",{value:!0})},a.t=function(t,e){if(1&e&&(t=a(t)),8&e)return t;if(4&e&&"object"==typeof t&&t&&t.__esModule)return t;var r=Object.create(null);if(a.r(r),Object.defineProperty(r,"default",{enumerable:!0,value:t}),2&e&&"string"!=typeof t)for(var n in t)a.d(r,n,function(e){return t[e]}.bind(null,n));return r},a.n=function(t){var e=t&&t.__esModule?function(){return t.default}:function(){return t};return a.d(e,"a",e),e},a.o=function(t,e){return Object.prototype.hasOwnProperty.call(t,e)},a.p="/",a(a.s=265)}({20:function(t,e,a){"use strict";a.r(e),e.default={props:{layoutActive:{type:String,required:!0},layoutLocation:{type:Object,required:!0}},data:function(){return{buttonAlign:"right",drawerAlign:"end",options:[{id:"layout",title:"Layout",children:[{id:"layout",title:"Layout",component:"form-image-group",cookies:!1,value:"default",options:[{text:"Layout Fluid",value:"default",image:"assets/images/navigation-side.svg",selected:!0},{text:"Layout Fixed",value:"fixed",image:"assets/images/navigation-top.svg"}]},{id:"rtl",title:"Text Direction",component:"custom-checkbox-toggle",options:[{value:!0},{value:!1,selected:!0}]}]},{id:"mainDrawer",title:"Main Drawer",children:[{id:"align",title:"Align",component:"b-form-radio-group",options:[{text:"Start",value:"start",selected:!0},{text:"End",value:"end"}]},{id:"sidebar",title:"Sidebar Skin",component:"b-form-radio-group",options:[{text:"Dark",value:"dark",selected:!0},{text:"Light",value:"light"},{text:"Transparent",value:"transparent"}]}]},{id:"mainNavbar",title:"Main Navbar",children:[{id:"navbar",title:"Main Navbar",component:"b-form-radio-group",options:[{text:"Primary",value:"primary",selected:!0},{text:"Light",value:"light"},{text:"Dark",value:"dark"}]}]}],config:{"layout.layout":function(t){t!==this.layoutActive&&(location=this.layoutLocation[t])},"layout.rtl":function(t){var e=this;document.querySelector("html").setAttribute("dir",t?"rtl":"ltr"),document.querySelectorAll(".mdk-drawer").forEach(function(t){return e.try(t,function(){this.mdkDrawer._resetPosition()})}),document.querySelectorAll(".mdk-drawer-layout").forEach(function(t){return e.try(t,function(){this.mdkDrawerLayout._resetLayout()})})},"mainDrawer.align":function(t){this.try(document.querySelector("#default-drawer"),function(){this.mdkDrawer.align=t})},"mainDrawer.sidebar":{light:{"#default-drawer .sidebar":{addClass:["sidebar-light"],removeClass:["sidebar-dark","bg-dark","sidebar-transparent-sm-up"]}},transparent:{"#default-drawer .sidebar":{addClass:["sidebar-light","sidebar-transparent-sm-up"],removeClass:["sidebar-dark","bg-dark","bg-white"]},"#default-drawer .sm-active-button-bg":{addClass:["js-sm-active-button-bg"],removeClass:["sm-active-button-bg"]}},dark:{"#default-drawer .sidebar":{addClass:["sidebar-dark","bg-dark"],removeClass:["sidebar-light","bg-white","sidebar-transparent-sm-up"]},"#default-drawer .js-sm-active-button-bg":{addClass:["sm-active-button-bg"],removeClass:["js-sm-active-button-bg"]}}},"mainNavbar.navbar":{light:{"#default-navbar .navbar-brand img":{src:"assets/images/logo/primary.svg"},"#default-navbar":{addClass:["navbar-light","bg-white","border-bottom"],removeClass:["navbar-dark","bg-primary","bg-dark"]}},dark:{"#default-navbar .navbar-brand img":{src:"assets/images/logo/white.svg"},"#default-navbar":{addClass:["navbar-dark","bg-dark"],removeClass:["navbar-light","bg-primary","bg-white","border-bottom"]}},primary:{"#default-navbar .navbar-brand img":{src:"assets/images/logo/white.svg"},"#default-navbar":{addClass:["navbar-dark","bg-primary"],removeClass:["navbar-light","bg-dark","bg-white","border-bottom"]}}}}}},computed:{computedOptions:function(){var t=this,e=JSON.parse(JSON.stringify(this.options));return e.map(function(e){e.children.filter(function(t){return!1===t.cookies}).map(function(e){t.layoutActive?e.options.map(function(e){return e.selected=e.value===t.layoutActive}):e.options.map(function(t){return t.selected=t.value===e.value})})}),e},localDrawerAlign:function(){var t=this.drawerAlign;try{t="end"===this.settings["mainDrawer.align"]?"start":"end"}catch(t){}return t},localButtonAlign:function(){var t=this.buttonAlign;try{t="end"===this.settings["mainDrawer.align"]?"left":"right",this.settings["layout.rtl"]&&(t="end"===this.settings["mainDrawer.align"]?"right":"left")}catch(t){}return t}},created:function(){this.listenOnRoot("fm:settings:state",this.onUpdate)},methods:{try:function(t,e){try{e.call(t)}catch(a){t.addEventListener("domfactory-component-upgraded",e)}}}}},265:function(t,e,a){t.exports=a(20)}});