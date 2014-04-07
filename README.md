System-Configure
================
<h2 style="text-align: left;">WHAT IS SYSTEM-CONFIGURE?</h2>
<p style="text-align: left;">    System-configure is a git solution for git the configure file of system.Such as linux ,windows and so on. I find the paper from here :http://baohaojun.github.io/blog/2012/10/22/my-config-cn.html.
This paper talk about function used factury model for general each configure file on each platform(linux ,windows or mac). I think this is a betty way for reinstall the operating system. So i build this git repository for achieve this idear. But I'm new for bash coding,the repository here is uncompleted.
If you want use this git repository,you should look before you leap.</p>

<h2 style="text-align: left;">ON WHAT SITUATION DOES IT RUN?</h2>
<p style="text-align: left;">    When you want reinstall your operating system or install your favorite os on new hardware. This repository will help!</p>

<h3 style="text-align: left;">  HARDWARE REQUIREMENTS:</h3>
<p style="text-align: left;">      You can use this in any hardware with system like linux or windows. You need make true that system had bash or other sh program for run .sh file for deploy configure file automatic.</p>

<h3 style="text-align: left;">  SOFTWARE REQUIREMENTS:</h3>
<p style="text-align: left;">       As above said,the bash or other program like it must need !</p>

<h2 style="text-align: left;">DOCUMENTATION:</h2>
<h3 style="text-align: left;">  HOW TO USE:</h3>
<h4 style="text-align: left;">      1 get the repository:</h4>
<p style="text-align: left;">           #git clone https://github.com/Quanjiang/System-Configure</p>
<h4>      2 run script in bin directory for deploy configure file:</h4>
<p style="text-align: left;">           #./YOUR_GIT_PATH/System-Configure/bin/Deploy-setting-file</p>

<h4>      <span style="font-size: 1rem; line-height: 1.846153846;">3 Now enjoy it !</span><span style="font-size: 1rem; line-height: 1.846153846;">          </span><span style="font-size: 1rem; line-height: 1.846153846;">  </span></h4>
<h4>      <span style="font-size: 1rem; line-height: 1.846153846;">4 Update your configure to System-Configure:</span><span style="font-size: 1rem; line-height: 1.846153846;">           </span></h4>
<p style="text-align: left;">              #./YOUR_GIT_PATH/System-Configure/bin/Update-setting-file</p>
<p style="text-align: left;">               ps: in this way you only update configure that in the System-configure already! if                          you need update new file into the project. you need copy the file into the System-Configure. and run Update-setting-file again.</p>

<h4>        5 Update to git or other cvs:</h4>
<p style="text-align: left;">                #./YOUR_GIT_PATH/System-Configure/bin/Push-to-Git</p>
<p style="text-align: left;">                ps:here only had git sh for update to github. If you want to update cvs or other thing. You need write it by your self!</p>

<h3>  HOW TO MAKE YOUR OWN ONE:</h3>
<h4>      1 Maybe you could copy bin/ directry into your own repository.</h4>
<h4>       2 See paper here: http://baohaojun.github.io/blog/2012/10/22/my-config-cn.html</h4>
<h2 style="text-align: left;">CONFIGURING THE SCRIPT:</h2>
<p style="text-align: left;">  You can rewrite files in bin directry as you like.</p>

<h2 style="text-align: left;">IF SOMETHING GOES WRONG:</h2>
<p style="text-align: left;">  Now Some important function is not work! I'm complete it now !</p>

<h2 style="text-align: left;">CONNECT ME:</h2>
<p style="text-align: left;">  You can just leav message on github or send me email quanjiang.gu&lt;&lt;a&gt;&gt;foxmail.com
Thank you for reading! Good Luck every day !</p>
<p style="text-align: center;">2014.4.7</p>
