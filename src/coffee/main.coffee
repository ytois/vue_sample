Vue = require 'vue'
_ = require 'lodash'

new Vue(
  el: '#main'

  data:
    number: ''
    number_list: []
    alert_text: ''
    filter_box: ''

  computed:
    count: ->
      @number.length

    number_class: ->
      if @validate
        ''
      else
        'alert-text'

    validate: ->
      if 10 <= @count and @count <= 11
        true
      else
        false

    filterNumbers: ->
      @number_list.filter( (num) ->
        num.match(@filter_box)
      .bind(@)
      )

  methods:
    normalization: _.debounce( (e) ->
        @number = e.target.value.match(/\d+/g).join('')
      , 500)

    add_list: ->
      if @validate
        @number_list.push(@number)
        @number = ''

  watch:
    count: ->
      if @count == 0 or @validate
        @alert_text = ''
      else
        @alert_text = '※10〜11文字で入力してください'

  mounted: ->
    main = document.getElementById('main')
    main.removeAttribute('class')
)
