module RandomResponder

  # TODO: Add more or provide interface for everyone to join the fun
  GOOD_RESPONSES = [
    'Thank you @{{name}}! Keep up the good work :thumbsup:',
    'Awesome @{{name}}! You make me proud :notes:!',
    'Great @{{name}}, looking forward to see it in action!',
    'Superduper @{{name}}! Carry on!'
  ]

  BAD_RESPONSES = [
    'Hey @krule there was a problem. So stop slacking and help @{{name}} :pada_face:'
  ]

  LAZY_RESPONSES = [
    'Hey @{{name}}, I am supposed to report happenings in last 24h but my maintainers were lazy and didn\'t finish me :heart_eyes_cat:'
  ]

  # TODO: Reduce code duplication
  class Good
    def self.respond(name)
      Mustache.render(GOOD_RESPONSES.sample, name: name)
    end
  end

  class Bad
    def self.respond
      Mustache.render(BAD_RESPONSES.sample, name: name)
    end
  end

  class Lazy
    def self.respond
      Mustache.render(LAZY_RESPONSES.sample, name: name)
    end
  end
end
