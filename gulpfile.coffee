gulp        = require 'gulp'
pug         = require 'gulp-pug'
browserify  = require 'browserify'
source      = require 'vinyl-source-stream'
browserSync = require 'browser-sync'
stylus      = require 'gulp-stylus'


gulp.task 'pug', ->
  option = pretty: true
  gulp.src ['./src/pug/**/*.pug', '!./src/pug/**/_*.pug']
    .pipe pug(option)
    .pipe gulp.dest('./dist/')

gulp.task 'coffee', ->
  browserify
    entries: ['./src/coffee/main.coffee']
    extensions: ['.coffee']
  .bundle()
  .pipe source('bundle.js')
  .pipe gulp.dest('./dist/js/')

gulp.task 'stylus', ->
  gulp.src ['./src/stylus/**/*.styl', '!./src/stylus/**/_*.styl']
    .pipe stylus()
    .pipe gulp.dest('./dist/css/')

gulp.task 'watch', ->
  gulp.watch ['./src/pug/**/*.pug'], ['pug']
  gulp.watch ['./src/coffee/**/*.coffee'], ['coffee']
  gulp.watch ['./src/coffee/**/*.vue'], ['coffee']
  gulp.watch ['./src/stylus/**/*.styl'], ['stylus']

gulp.task 'reload', ->
  browserSync.reload()

gulp.task 'browser-sync', ->
  browserSync(
    server:
      baseDir: './dist/'
      index: 'index.html'
  )
  # ファイル変更時にリロードする
  gulp.watch './dist/**/*.html', ['reload']
  gulp.watch './dist/js/**/*.js', ['reload']
  gulp.watch './dist/css/**/*.css', ['reload']

gulp.task 'default', ['pug', 'coffee', 'stylus', 'browser-sync', 'watch']
