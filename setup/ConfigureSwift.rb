module Pod

  class ConfigureSwift

    attr_reader :configurator

    def self.perform(options)

      new(options).perform
    end

    def initialize(options)

      @configurator = options.fetch(:configurator)
    end

    def perform

      framework = configurator.ask_with_answers("Which testing frameworks will you use", ["Quick", "None"]).to_sym

      case framework

        when :quick
          configurator.add_pod_to_podfile "Quick', '~> 1.3.0"
          configurator.add_pod_to_podfile "Nimble', '~> 7.1.1"
          configurator.set_test_framework "quick", "swift", "swift"

        when :none
          configurator.set_test_framework "xctest", "swift", "swift"
      end

      Pod::ProjectManipulator.new({
        :configurator => @configurator,
        :xcodeproj_path => "templates/swift/Example/PROJECT.xcodeproj",
        :platform => :ios,
        :remove_demo_project => :yes,
        :prefix => ""
      }).run

      `mv ./templates/swift/* ./`

      # There has to be a single file in the Classes dir
      # or a framework won't be created
      `touch Pod/Classes/ReplaceMe.swift`

      # The Podspec should be 8.0 instead of 7.0
      text = File.read("NAME.podspec")
      text.gsub!("7.0", "8.0")
      File.open("NAME.podspec", "w") { |file| file.puts text }

      # remove podspec for osx
      `rm ./NAME-osx.podspec`
    end
  end
end
