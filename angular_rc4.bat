@echo off
mkdir %1
chdir %1
(echo {"compilerOptions":{"target":"es5","module":"commonjs","moduleResolution":"node","sourceMap":"true","emitDecoratorMetadata":"true","experimentalDecorators":"true","removeComments":"false","noImplicitAny":"false"}})>tsconfig.json
echo *****tsconfig.json file added***** 
echo
(echo {"globalDependencies":{"core-js":"registry:dt/core-js#0.0.0+20160602141332","jasmine":"registry:dt/jasmine#2.2.0+20160621224255","node":"registry:dt/node#6.0.0+20160621231320"}})>typings.json
echo *****typings.json file added***** 
echo
(echo {"name":"angular2-quickstart","version":"1.0.0","scripts":{"start":"tsc && concurrently \"npm run tsc:w\" \"npm run lite\" ", "lite":"lite-server","postinstall":"typings install","tsc":"tsc","tsc:w":"tsc -w","typings":"typings"},"license":"ISC","dependencies":{"@angular/common":"2.0.0-rc.4","@angular/compiler":"2.0.0-rc.4","@angular/core":"2.0.0-rc.4","@angular/forms":"0.2.0","@angular/http":"2.0.0-rc.4","@angular/platform-browser":"2.0.0-rc.4","@angular/platform-browser-dynamic":"2.0.0-rc.4","@angular/router":"3.0.0-beta.1","@angular/router-deprecated":"2.0.0-rc.2","@angular/upgrade":"2.0.0-rc.4","systemjs":"0.19.27","core-js":"^2.4.0","reflect-metadata":"^0.1.3","rxjs":"5.0.0-beta.6","zone.js":"^0.6.12","angular2-in-memory-web-api":"0.0.14","bootstrap":"^3.3.6"},"devDependencies":{"concurrently":"^2.0.0","lite-server":"^2.2.0","typescript":"^1.8.10","typings":"^1.0.4"}})>package.json
echo *****packages.json file added***** 
echo
@echo (function(global){var map = {'app':'app','@angular':'node_modules/@angular','angular2-in-memory-web-api':'node_modules/angular2-in-memory-web-api','rxjs':'node_modules/rxjs'};  >systemjs.config.js
@echo var packages = {'app':{ main: 'main.js',  defaultExtension:'js'},'rxjs':{ defaultExtension:'js'},'angular2-in-memory-web-api':{ defaultExtension:'js'}}; >>systemjs.config.js
@echo var ngPackageNames = ['common','compiler','core','http','platform-browser','platform-browser-dynamic','router','router-deprecated','upgrade']; >>systemjs.config.js
@echo function packIndex(pkgName){packages['@angular/'+pkgName]={main:'index.js',defaultExtension:'js'};}   >>systemjs.config.js
@echo functionpackUmd(pkgName){packages['@angular/'+pkgName]={main:'/bundles/'+pkgName+'.umd.js',defaultExtension:'js'};}   >>systemjs.config.js
@echo var setPackageConfig=System.packageWithIndex ? packIndex : packUmd;   >>systemjs.config.js
@echo ngPackageNames.forEach(setPackageConfig);>>systemjs.config.js
@echo var config = { map: map, packages: packages } >>systemjs.config.js
@echo System.config(config); })(this); >>systemjs.config.js
echo *****systemjs.config.js file added***** 
echo
echo
echo *****installing dependency*****
call npm install
mkdir app
@echo import {Component} from '@angular/core';>app/app.component.ts
echo.>>app/app.component.ts 
@echo @Component({>>app/app.component.ts 
@echo      selector: 'my-app',>>app/app.component.ts 
@echo      template: '^<h1^>My First Angular 2 App^</h1^>'>>app/app.component.ts 
@echo })>>app/app.component.ts 
@echo export class AppComponent { }>>app/app.component.ts 
echo *****app/app.component.ts file added***** 
echo 
@echo import {bootstrap}    from '@angular/platform-browser-dynamic'; >app/main.ts
@echo import {AppComponent} from './app.component';>>app/main.ts
echo.>>app/main.ts
@echo bootstrap(AppComponent);>>app/main.ts
echo *****app/main.ts file added***** 
echo
@echo ^<html^> >index.html
@echo  ^<head^> >>index.html
@echo    ^<title^>Angular 2 QuickStart ^</title^> >>index.html
@echo    ^<meta name="viewport" content="width=device-width, initial-scale=1"^>  >>index.html  
@echo    ^<link rel="stylesheet" href="styles.css"^> >>index.html
echo.>>index.html
@echo    ^<!-- 1. Load libraries --^> >>index.html
@echo    ^<!-- Polyfill(s) for older browsers --^> >>index.html
@echo    ^<script src="node_modules/core-js/client/shim.min.js"^> ^</script^> >>index.html
@echo    ^<script src="node_modules/zone.js/dist/zone.js"^> ^</script^> >>index.html
@echo    ^<script src="node_modules/reflect-metadata/Reflect.js"^> ^</script^> >>index.html   
@echo    ^<script src="node_modules/systemjs/dist/system.src.js"^> ^</script^> >>index.html   
echo.>>index.html
@echo    ^<script src="systemjs.config.js"^> ^</script^> >>index.html
@echo    ^<script^>  System.import('app').catch(function(err){console.error(err);}); ^</script^> >>index.html
@echo  ^</head^> >>index.html
echo.>>index.html
@echo  ^<!-- 3. Display the application --^> >>index.html
@echo  ^<body^> >>index.html
@echo    ^<my-app^>Loading...^</my-app^> >>index.html
@echo  ^</body^> >>index.html
@echo  ^</html^>  >>index.html
echo *****index.html file added*****
echo
@echo /* Master Styles */  >styles.css
@echo h1 { >>styles.css
@echo   color: #369;  >>styles.css
@echo   font-family: Arial, Helvetica, sans-serif;  >>styles.css  
@echo   font-size: 250%; >>styles.css
@echo } >>styles.css
@echo body {  >>styles.css
@echo   margin: 2em;  >>styles.css
@echo } >>styles.css
echo *****styles.css file added*****
echo
echo
echo *****starting your application*****
call npm start
