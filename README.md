# 学习汇总

> 本文档 参考[javaGuider](https://github.com/Snailclimb/JavaGuide#java)进行梳理

## 快速部署

+ 安装脚本

    ```js
    npm install -g gitbook-cli	
    ```

+ 初始化

    ```
    gitbook init
    ```

+ `构建`

	```
	gitbook build
	```

+ 启动服务

  ```
  gitbook serve
  ```

  



```json
{
    "button": [
        {
            "type": "click", 
            "name": "获取红包", 
            "key": "V1001_TODAY_MUSIC"
        }, 
        {
            "name": "我的账号", 
            "sub_button": [
                {
                    "type": "click", 
                    "name": "添加手机号", 
                    "key": "ADD_PHONE"
                }, 
                {
                    "type": "click", 
                    "name": "添加COOKIE", 
                    "key": "ADD_COOKIE"
                }, 
                {
                    "type": "view", 
                    "name": "搜索", 
                    "url": "https://clickear.top"
                }, 
                {
                    "type": "click", 
                    "name": "绑定账号", 
                    "key": "BIND_ELEMENT"
                }
            ]
        }
    ]
}
```

