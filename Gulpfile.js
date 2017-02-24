var gulp         = require("gulp"),
    gutil        = require('gulp-util'),
    notify       = require("gulp-notify"),
    concat       = require("gulp-concat"),
    imagemin     = require("gulp-imagemin"),
    sass         = require("gulp-sass"),
    cleanCSS     = require('gulp-clean-css'),
    autoprefixer = require('gulp-autoprefixer');

var config = {
  paths: {
    images: {
      src:  ["images/**/*.jpg", "images/**/*.jpeg", "images/**/*.png"],
      dest: "images"
    },
    sass: {
      path: "sass/**/*.scss",
      src: [
        "sass/main.scss",
        "sass/ie8.scss",
        "sass/ie9.scss"
      ],
      dest: "css"
    }
  }
};

gulp.task("images", function() {
  return gulp.src(config.paths.images.src)
    .pipe(imagemin({
      progressive: true,
      interlaced: true
    }))
    .pipe(gulp.dest(config.paths.images.dest));
});

gulp.task("sass", function() {
  return gulp.src(config.paths.sass.src)
    .pipe(sass().on('error', sass.logError))
    .pipe(autoprefixer({
        browsers: ['last 2 versions'],
        cascade: false
    }))
    .pipe(cleanCSS({
      advanced: false
    }))
    .pipe(gulp.dest(config.paths.sass.dest));
});

gulp.task("build", ["sass", "images"]);

gulp.task("watch", function() {
  gulp.watch(config.paths.sass.path, ["sass"]);
});

gulp.task("default", function() {
  console.log('Silence is gold');
});