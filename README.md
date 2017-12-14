# 構成

- HTML: Pug
- JS:   Coffeescript
- CSS:  Stylus

# run server

```
# git clone
git clone https://github.com/ytois/vue_sample.git
cd vue_sample

# 必要パッケージのインストール
npm install

# browser-syncの起動
npm start
```

# Vue.js

## 基本

```CoffeeScript
new Vue(
  el: '#main'
  data:
    message: 'hello world'
)
```

```Pug
div#main
  p {{ messge }}
```
