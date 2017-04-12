<h1>linux 虚拟adsl 的使用 </h1>

<h2>感谢 sceext222 的贡献</h2>

  https://github.com/sceext222/vadsll.git 


## 开始正题 vadsll的安装使用 ##

<pre>
    nftables libnetfilter_queue nodejs npm rust cargo git make
</pre>


+ **1**,准备
<code>
	> nodejs --https://nodejs.org/en/  <br/>
  	> rustc --curl https://sh.rustup.rs -sSf | sh
</code>

+ **2**.安装需要的软件支持
  <code>
   >  1).git  -- sudo apt install git  <br/>
   >  2).make --sudo apt install make  <br/>
   >  3).nftables libnetfilter-queue -- sudo apt install nftables  libnetfilter-queue1 libnetfilter-queue-dev
  </code>

+ **3**.获取vadsll 
  ...
    git clone https://github.com/sceext222/vadsll --single-branch --depth=1
  ...
+ **4**.安装
+ **1)**.cd {user}/vadsll
+ **2)**.make init
+ **3)**.make build 
+ **4)**. cd systemd 
+ **5)**.修改vadsll.service
...
  gedit vadsll.service
...
  改成如下: 
...
  {
    ExecStart={你的node物理路径} /usr/local/lib/vadsll/vadsll/vadsll.js --login
    ExecStop={你的node物理路径} /usr/local/lib/vadsll/vadsll/vadsll.js --logout
  }
...

+ **6)**.sudo make install 

+ **7)**.改配置文件

...
  $ cd /usr/local/etc/vadsll
  $ cp config.json.sample config.json
  $ sudo gedit config.json

    {
      "interface": "{你的网卡地址}",
      "account": "{电信宽带帐号}",
      "password": "{密码}",

      "auth_server": "{你的认证服务器地址}:1812",
      "ethernet_mtu": 1500,
      "vadsl_mtu": 1476,
      "keep_alive_timeout_s": 300,

      "nfqueue_id": 44001,
      "nft_table": "vadsll",
      "nft_hook_priority": 150,
      "#": "config file for VADSLL"
    }
...

##PS:##

+ **1)**.此处的认证服务器地址获取方法如下两种：
  + **a**.使用抓包程序，抓包分析
  + **b**.虚拟adsl软件安装地址中有一个配置文件，其中有这个认证服务器地址
+ **2)**.网卡地址获取方式：
...
ip link
...
  一般e开头的是有限网卡，w开头的是无线网卡

+ **5**. Login

  ...
  $ sudo systemctl start vadsll
  ...

+ **6**. Logout

  <code>
  $ sudo systemctl stop vadsll
  </code>
