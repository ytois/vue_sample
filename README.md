# 構成

HTML: Pug
JS:   Coffeescript
CSS:  Stylus
をGulpでビルドして、Brosersyncで表示

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

```
new Vue(
  el: '#main'
  data:
    message: 'hello world'
)
```

```
div#main
  input(v-model='message')
  p {{ messge }}
```

## メソッドを使ってみる & イベントをつけてみる

```
new Vue(
  el: '#main'
  data:
    alert_text: 'Alert!'
  methods:
    showAlert: ->
      alert(@alert_text)
)
```

```
div#main
  button(v-on:click='showAlert')
```

## if & ループで表示してみる

```
new Vue(
  el: '#main'
  data:
    list: [1, 2, 3, 4, 5]
  methods:
    isOdd: (i) ->
      i % 2 != 0
)
```

```
div#main
  ul(v-for='i in list')
    li(v-if='isOdd(i)') {{ i }}
```

## 算出プロパティ & 属性にバインドしてみる

```
new Vue(
  el: '#main'
  data:
    message: 'hello world'
  computed:
    count: ->
      @message.length
    class_name: ->
      if @count > 5
        'text-bold'
      else
        'text-normal'
)
```

```
style
  .text-normal {}
  .text-bold { font-weight: bold; }

div#main
  input(v-model='message')
  p {{ count }}文字
  p(v-bind:class='class_name') {{ messge }}
```

## componentを使ってみる

```
VueChat = Vue.extend(
  props: ['width']
  # 型の指定やデフォルト値の指定もできる
  # props:
  #   width: Number

  # テンプレート配下は単一の要素でなくてはならない
  template: """
    <div>
      <input :style="{ width: width + 'px'}" v-model='message'>
      <button v-on:click='send'>send</button>
    </div>
  """

  # dataは関数でなくてはならない
  data: ->
    message: 'default message.'

  methods:
    send: ->
      null
)

new Vue(
  el: '#main'
  components:
    chat: VueChat
)
```

```
div#main
  chat(width='200')
```
