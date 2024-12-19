
# Build a custom executable for Windows

*The Pharo virtual machine for Windows comes with a Pharo.exe, a PharoConsole.exe and a Pharo.dll together with several shared dynamic link libraries (DLLs). The VM logic is mostly within the Pharo.dll and the Pharo.exe is only a small entry executable. But this EXE comes with the Pharo logo as icon and *

*The PharoApplicationGenerator allows you to generate a cmake project that you can use to build an own custom entry executable. For instance a MyKillerApp.exe with a custom icon for the Windows start menu.*


## Install PharoApplicationGenerator
First install the application generator into your [Pharo](https://www.pharo.org) image using

```smalltalk
Metacello new
	baseline: 'ApplicationGenerator';
	repository: 'github://tesonep/PharoApplicationGenerator/src';
	load
```

## Install MSYS and tooling

To install MSYS2 just visit 

[https://www.msys2.org](https://www.msys2.org)

and download the **installer executable**. As of this writing this is **msys2-x86_64-20241208.exe**. Run the installer with the full admin permisson and finally this opens a small unix like shell window with a bash shell. 

Running as an admin is necessary to save you from trouble. Close it first time.

Now go to the start menu and enter "MSYS" - you will see that several icons had been created:
- MSYS UCRT64
- MSYS CLANG64
- MSYS CLANGARM64
- MSYS MSYS
- MSYS MINGW64

Choose the one that is labeled **"MSYS MINGW64"** with a blue icon and right click on it to open the context menu and choose "Run as administrator".

### Install cmake package
First update the installer
````Shell
pacman -Syu
````

then let it install the **cmake** package
````Shell
pacman -S mingw-w64-x86_64-cmake
````
Verify that cmake is installed by running:
````Shell
cmake -version
````

**Important:** if you get a "command not found" then you did not apply the installation steps by using *admin permission* as it is described [in an issue here](https://github.com/msys2/setup-msys2/issues/118)

### Install gcc compiler package

Now let it install the **gcc** (GNU Compiler) 
package

````Shell
pacman -S mingw-w64-x86_64-cmake
````

Verify that the compiler is installed by running:
````Shell
gcc -version
````

### Install other packages
Another package that is required is unzip as this is used to unzip the downloaded zip files for the VM / VM includes

````Shell
pacman -S unzip
````

Again you can verify if the command is available
````Shell
unzip
````

## Implement custom App definitions

### A class with generator definitions

Now we need to define a class that helps us to configure some properties that will be used to generate the output project.

Lets assume we have a Pharo project called **"mykiller-app"** as a *project name* in Iceberg. So lets implement a simple Pharo *class* **MKApp** to host the settings. This class is in the git managed project within the package **"MyKiller-App"**

```Smalltalk
Object << #MKApp
	slots: {};
	package: 'MyKiller-App'
```	
Add this package to your project in Iceberg and save it.

### Project structure

This gives a typical Tonel project layout with a standard **src folder** hosting the serialized class file. 

*Important: Historically same projects store their sources directly in the root folder of the project or in a "repo" folder - we would not recommend that. Instead it is better to have a proper project layout.*

Now additionally in our project structure we would like to add 
- an "res" folder for the resources such as an icon file and
- an "app" folder where the app should be generated:

- mykiller-app
  - src
    - BaselineOfMyKillerApp
		- BaselineOfMyKillerApp.class.st
		- package.st
	- MyKiller-App
		- MKApp.class.st
		- package.st
  - res
  	- app.ico
  - app

### Some utility methods 

Now implement a class side method *(MyApp class)>>#repositoryLocation*

```Smalltalk
  repositoryLocation
	<script: 'self repositoryLocation inspect'>

	^ (IceRepository repositoryNamed: 'mykiller-app') location
```
that return the root folder of our project. As the method is annotated with a script pragma you can click on the icon close to the method within the Calypso system browser to verify that the path is correct.

Also add a method 

```Smalltalk
iconFile
	<script: 'self repositoryLocation openInOSFileBrowser'>

	^ self repositoryLocation / 'res' / 'app.ico'
```
that provides the location of the icon file.

*Tip: you can easily create an appropriate icon file (*.ico) using Favicon generators like [https://favicon.io](https://favicon.io) or [https://www.favicon-generator.org](https://www.favicon-generator.org)* but also one of the free icon editors for windows.

### The definitions

Now we define a method that calls the generator and creates the stubs for us:

```Smalltalk
generateWindowsExecutableProject
	<script>

	AppGeneratorWindowsGenerator new
		properties: {
			#AppName -> 'KillerApp'.
			#InfoString -> 'The Killer App'.
			#BundleIdentifier -> 'org.mycompany.killerap'.
			#ShortVersion -> '1.0.0'.
			#DisplayName -> 'Killer App'.
			
			#IconFile -> self iconFile.
			#CompanyName -> 'mycompany.com'.
			#LegalCopyright -> 'Copyright \251 https://www.mycompany.com 2024\0'.
			
			"https://files.pharo.org/vm/pharo-spur64-headless/Windows-x86_64/include/PharoVM-10.3.2-7d07f5d1-Windows-x86_64-include.zip"
			#VMIncludeZipFile -> 'PharoVM-10.3.2-7d07f5d1-Windows-x86_64-include.zip'.
			
			"https://files.pharo.org/vm/pharo-spur64-headless/Windows-x86_64/PharoVM-10.3.2-7d07f5d1-Windows-x86_64-bin.zip"
			#VMZipFile -> 'PharoVM-10.3.2-7d07f5d1-Windows-x86_64-bin.zip' 
		} asDictionary;
		outputDirectory: self repositoryLocation / 'app';
		generate.
	(self repositoryLocation / 'app') openInOSFileBrowser 
```	
The key value pairs represent properties used to generate the resource file and define some info available from within the executable.

When you run this method by clicking the methods icon in the system browser or by evaluating

```Smalltalk
MyKillerApp generateWindowsExecutableProject
```

the project files are created in the app folder. 

### Compiling the final result

Within the already open MSYS2 Unix shell navigate to the app folder. Be aware that this requires Unix style path names and using "/" instead of "\". You should also know that the drive letters of Windows could be found under the root level of the emulated Unix environment. So "C:\" becomes "/C/".


#### Example

If you Project and "app" folder is under 

```
C:\Users\Administrator\Documents\Pharo\images\Pharo13\pharo-local\iceberg\mycompany\mykiller-app\app\
```
you have to nagigate using the "cd" (change directory) Unix command into the folder with

```shell
cd /C/Users/Administrator/Documents/Pharo/images/Pharo13/pharo-local/iceberg/mycompany/mykiller-app\app\
```

Now run **cmake** command which is processing the generated *CMakeLists.txt* file.

```shell
cmake .
```
and run **ninja** 

```shell
ninja
```

to build the final output executable **MyApp.exe** into the folder  found in **\app\build\output''

