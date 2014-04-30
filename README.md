System-Configure
===================================


WHAT IS SYSTEM-CONFIGURE?
-----------------------------------
System-configure is a git solution for git the configure file of system.Such as linux ,windows and so on. I find the paper from here :http://baohaojun.github.io/blog/2012/10/22/my-config-cn.html. This paper talk about function used factury model for general each configure file on each platform(linux ,windows or mac). I think this is a betty way for reinstall the operating system. So i build this git repository for achieve this idear. But I'm new for bash coding,the repository here is uncompleted. If you want use this git repository,you should look before you leap.

ON WHAT SITUATION DOES IT RUN?
-----------------------------------
When you want reinstall your operating system or install your favorite os on new hardware. This repository will help!

### HARDWARE REQUIREMENTS:
 You can use this in any hardware with system like linux or windows. You need make true that system had bash or other sh program for run .sh file for deploy configure file automatic.

### SOFTWARE REQUIREMENTS:
 As above said,the bash or other program like it must need !

DOCUMENTATION:
-----------------------------------

### HOW TO USE:

#### 1 get the repository:
	 #git clone https://github.com/Quanjiang/System-Configure
#### 2 run script in bin directory for deploy configure file:
	  #./YOUR_GIT_PATH/System-Configure/bin/deploy-auto.sh -r listfile
      ps: you need edit listfile. more detail see listfile
#### 3 Now enjoy it !
#### 4 Update your configure to System-Configure: 
	 #./YOUR_GIT_PATH/System-Configure/bin/deploy-auto.sh -b listfile
     ps: you need add file path into listfile before update!
####  5 Update to git or other cvs:
	   #./YOUR_GIT_PATH/System-Configure/bin/Push-to-Git
       ps:here only had git sh for update to github. If you want to update cvs or other thing. You need write it by your self!
### HOW TO MAKE YOUR OWN ONE:

#### 1 Maybe you could copy bin/ directry into your own repository.

#### 2 See paper here: http://baohaojun.github.io/blog/2012/10/22/my-config-cn.html

CONFIGURING THE SCRIPT:
-----------------------------------
You can rewrite files in bin directry as you like.

IF SOMETHING GOES WRONG:
-----------------------------------
Now Some important function is not work! I'm complete it now !

CONNECT ME:
-----------------------------------
You can just leav message on github or send me email quanjiang.gu<<a>>foxmail.com Thank you for reading! Good Luck every day !

2014.4.30(new)
2014.4.7
