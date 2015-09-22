gulp       = require 'gulp'
bower      = require 'gulp-bower'
bowerFiles = require 'main-bower-files'
plumber    = require 'gulp-plumber'
concat     = require 'gulp-concat'
gulpFilter = require 'gulp-filter'
browserify = require 'browserify'
source     = require 'vinyl-source-stream'
watchify   = require 'watchify'
sass       = require 'gulp-sass'
notify     = require 'gulp-notify'

gulp.task 'js', ->
  browserify
    entries: ['./apps/coffee/index.coffee']
    extensions: ['.coffee', '.js']
  .transform 'coffeeify'
  .bundle()
  .on 'error', handleErrors
  .pipe source 'app.js'
  .pipe gulp.dest './build/javascripts/'

gulp.task 'css', ->
  gulp
  .src './apps/sass/*.scss'
  .pipe plumber()
  .pipe sass()
  .pipe concat('app.css')
  .pipe gulp.dest './build/stylesheets'

gulp.task 'vendor', ->
  jsFilter = gulpFilter '**/*.js'
  cssFilter = gulpFilter '**/*.css'
  gulp.src(bowerFiles())
  .pipe jsFilter
  .pipe plumber()
  .pipe concat('vendor.js')
  .pipe gulp.dest('./build/javascripts/')
  gulp.src(bowerFiles())
  .pipe cssFilter
  .pipe plumber()
  .pipe concat('vendor.css')
  .pipe gulp.dest('./build/stylesheets/')

gulp.task 'bower', ->
  bower {cmd: 'update'}

gulp.task 'copy', ->
  gulp.src ['apps/**/*.html'], { base: 'apps' }
  .pipe gulp.dest('./build/')

gulp.task 'build', ['vendor', 'js', 'css', 'copy']

gulp.task 'watch', ['vendor', 'js', 'css', 'copy'], ->
  gulp.watch './apps/**/*', ['vendor', 'js', 'css', 'copy']

handleErrors = (err) ->
  console.log err
  notify({
    title: "Compile Error",
    message: "<%= err.message %>"
  })
  @emit 'end'
