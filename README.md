System-Configure
================
<h1 style="text-align: left;">WHAT IS SYSTEM-CONFIGURE?</h1>
<p style="text-align: left;">                         System-configure is a git solution for git the configure file of system.Such as linux ,windows and so on. I find the paper from here :http://baohaojun.github.io/blog/2012/10/22/my-config-cn.html.
This paper talk about function used factury model for general each configure file on each platform(linux ,windows or mac). I think this is a betty way for reinstall the operating system. So i build this git repository for achieve this idear. But I'm new for bash coding,the repository here is uncompleted.
If you want use this git repository,you should look before you leap.</p>

<h1 style="text-align: left;">ON WHAT SITUATION DOES IT RUN?</h1>
<p style="text-align: left;">                         When you want reinstall your operating system or install your favorite os on new hardware. This repository will help!</p>

<h2 style="text-align: left;">HARDWARE REQUIREMENTS:</h2>
<p style="text-align: left;">                         You can use this in any hardware with system like linux or windows. You need make true that system had bash or other sh program for run .sh file for deploy configure file automatic.</p>

<h2 style="text-align: left;">SOFTWARE REQUIREMENTS:</h2>
<p style="text-align: left;">           As above said,the bash or other program like it must need !</p>

<h1 style="text-align: left;">DOCUMENTATION:</h1>
<h2 style="text-align: left;">      HOW TO USE:</h2>
<h3 style="text-align: left;">                   1 get the repository:</h3>
#git clone https://github.com/Quanjiang/System-Configure
<h3>                   2 run script in bin directory for deploy configure file:</h3>
<p style="text-align: left;">                         #./YOUR_GIT_PATH/System-Configure/bin/Deploy-setting-file</p>

<h3>                   3 Now enjoy it !</h3>
<h3>                   4 Update your configure to System-Configure:</h3>
<p style="text-align: left;">                         #./YOUR_GIT_PATH/System-Configure/bin/Update-setting-file</p>
<p style="text-align: left;">                         ps: in this way you only update configure that in the System-configure already! if                          you need update new file into the project.
you need copy the file into the System-Configure. and run Update-setting-file again.</p>

<h3>                   5 Update to git or other cvs:</h3>
<p style="text-align: left;">                         #./YOUR_GIT_PATH/System-Configure/bin/Push-to-Git</p>
<p style="text-align: left;">                         ps:here only had git sh for update to github. If you want to update cvs or other thing. You need write it by your self!</p>

<h2>      HOW TO MAKE YOUR OWN ONE:</h2>
<h3>                   1 Maybe you could copy bin/ directry into your own repository.</h3>
<h3>                   2 See paper here: http://baohaojun.github.io/blog/2012/10/22/my-config-cn.html</h3>
<h1 style="text-align: left;">
CONFIGURING THE SCRIPT:</h1>
<p style="text-align: left;">                         You can rewrite files in bin directry as you like.</p>

<h1 style="text-align: left;">IF SOMETHING GOES WRONG:</h1>
<p style="text-align: left;">                         Now Some important function is not work! I'm complete it now !</p>

<h1 style="text-align: left;">CONNECT ME:</h1>
<p style="text-align: left;">                         You can just leav message on github or send me email quanjiang.gu&lt;&lt;a&gt;&gt;foxmail.com
Thank you for reading! Good Luck every day !</p>
<p style="text-align: center;">2014.4.7</p>WHAT IS SYSTEM-CONFIGURE?
	
	 System-configure is a git solution for git the configure file of system.Such as linux ,windows and so on. I find the paper from here :http://baohaojun.github.io/blog/2012/10/22/my-config-cn.html. 
	 This paper talk about function used factury model for general each configure file on each platform(linux ,windows or mac). I think this is a  betty way for reinstall the operating system. So i build this git repository for achieve this idear. But I'm new for bash coding,the repository here is uncompleted.
	 If you want use this git repository,you should look before you leap.	 

ON WHAT SITUATION DOES IT RUN?
   
	When you want reinstall your operating system or install your favorite os on new hardware. This repository will help!

HARDWARE REQUIREMENTS:
			 You can use this in any hardware with system like linux or windows. You need make true that system had bash or other sh program for run .sh file for deploy configure file automatic.

SOFTWARE REQUIREMENTS:
			 As above said,the bash or other program like it must need ! 

DOCUMENTATION:

HOW TO USE:

			1 get the repository:

			  	  #git clone https://github.com/Quanjiang/System-Configure

			2 run script in bin directory for deploy configure file:

			  	  #./YOUR_GIT_PATH/System-Configure/bin/Deploy-setting-file
			
			3 Now enjoy it !
			

			4 Update your configure to System-Configure:
			
				 #./YOUR_GIT_PATH/System-Configure/bin/Update-setting-file
		     
              ps: in this way you only update configure that in the System-configure already! if you need update new file into the project.
                  you need copy the file into the System-Configure. and run Update-setting-file again.
 
            5 Update to git or other cvs:

			    #./YOUR_GIT_PATH/System-Configure/bin/Push-to-Git
			
			  ps:here only had git sh for update to github. If you want to update cvs or other thing. You need write it by your self!
			     
				   		 

HOW TO MAKE YOUR OWN ONE:

			1 Maybe you could copy bin/ directry into your own repository.

			2 See paper here: http://baohaojun.github.io/blog/2012/10/22/my-config-cn.html


CONFIGURING THE SCRIPT:

		You can rewrite files in bin directry as you like.

IF SOMETHING GOES WRONG:
   			 
		Now Some important function is not work! I'm complete it now !

CONNECT ME:

		You can just leav message on github or send me email quanjiang.gu<<a>>foxmail.com


		Thank you for reading! Good Luck every day !

                                                          2014.4.7

