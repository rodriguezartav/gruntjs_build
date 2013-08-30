class Helper

  @randomChars: (len) ->
    chars = '';

    while (chars.length < len) 
      chars += Math.random().toString(36).substring(2);

    return chars.substring(0, len);

module.exports = (grunt) ->

  build = Helper.randomChars(5)

  grunt.initConfig

    clean:
      lib:
        src: "./public/**/*.*"
      unit:
        src: "./test/unit/*.js"

    coffee:
      lib: 
        expand: true,
        flatten: true,
        cwd: './src/',
        src: ['*.coffee'],
        dest: './public/js',
        ext: '.js'

      unit:
        expand: true,
        flatten: true,
        cwd: './test/unit-src',
        src: ['*.coffee'],
        dest: './test/unit',
        ext: '.js'          

    mochaTest:
      unit:
        options:
          reporter: 'spec'
        src: ['test/unit/*.js']

    jade: 
      production: 
        files:
          "./public/index.html": ["./src/index.jade"]
        options: 
          data: 
            build: "/#{build}"
            path: ""

      dev: 
        files:
          "./public/index.html": ["./src/index.jade"]
        
        options:
          pretty: true
          data:
            build: "./js"
            path: ""

    s3:
      options: 
        bucket: "gruntjs.rodcocr.com",
        access: 'public-read'
      test:
        options:
          encodePaths: true,
          maxOperations: 20

        upload: 
          [
             { src: './public/js/*.js', dest: "#{build}/", gzip: true ,access: 'public-read' , headers: "Cache-Control": "max-age=30000000" }
             { src: './public/*.html', dest: "", gzip: true , access: 'public-read' , headers: "Cache-Control": "max-age=300" }
          ]

  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-contrib-coffee');
  grunt.loadNpmTasks('grunt-mocha-test');
  grunt.loadNpmTasks('grunt-contrib-jade');
  grunt.loadNpmTasks('grunt-s3');  

  grunt.registerTask('compile', ['clean:lib','coffee:lib',"jade:dev"]);  
   
  grunt.registerTask('test', ['clean:unit','coffee:unit', "jade:dev", "mochaTest"]);   
  
  grunt.registerTask('jadeDev', ["jade:dev"]);

  grunt.registerTask('jadeProd', ["jade:production"]);

  grunt.registerTask('build', ["clean", "coffee" , "jade:production" ,  "mochaTest" , "s3"]);
  