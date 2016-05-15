module.exports = (grunt) ->
  grunt.initConfig
    coffee:
      dist:
        expand: true
        flatten: false
        cwd: "src/js"
        src: ["**/*.coffee"]
        dest: 'build/js'
        ext: ".js"
      spec:
        expand: true
        flatten: false
        cwd: 'spec/js'
        src: ["**/*.coffee"]
        dest: 'build/spec/js'
        ext: '.js'

    haml:
      dist:
        expand: true
        flatten: false
        cwd: 'src'
        src: ['**/*.haml']
        dest: 'build'
        ext: '.html'
      dist:
        expand: true
        flatten: false
        cwd: 'spec'
        src: ['**/*.haml']
        dest: 'build'
        ext: '.html'
    copy:
      main:
        expand: true
        cwd: ''
        src: ['./css/*', './img/*']
        dest: '../'
      spec:
        files:
          'build/js/lib/jasmine-jquery.js': 'node_modules/jasmine-jquery/lib/jasmine-jquery.js'

    jasmine:
      spec:
        src: 'build/js/ko-components/**/*.js'
        options:
          specs: 'build/spec/js/**/*.js'
          helpers: 'build/js/lib/shared-config.js'
          template: 'spec/requirejs-runner.tmpl'
          vendor: [
            'https://cdnjs.cloudflare.com/ajax/libs/require.js/2.2.0/require.min.js'
          ]

    watch:
      coffee:
        files: ["src/js/**/*.coffee"]
        tasks: ["compile:coffee"]
      haml:
        files: ["src/**/*.haml"]
        tasks: ["compile:haml"]
      static:
        files: ['./res/*', './css/*', './img/*']
        tasks: ["compile:copy"]

    connect:
      server:
        options:
          port: 8000
          base: 'build'

  #Load Tasks
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-haml2html'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-jasmine'

  grunt.registerTask 'compile', ['coffee', 'haml', 'copy']
  grunt.registerTask 'test', ['compile', 'jasmine']
  grunt.registerTask 'server', ['compile', 'connect:server', 'watch']
