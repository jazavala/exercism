class PhoneNumber
  def self.clean(phone_number)
    PhoneNumber.new(phone_number).clean
  end

  NANP= %r{
    \A
    (?<international_country_code>1?)
    (?<area_code>[2-9]{1}[0-9]{2})
    (?<local_number>[2-9]{1}[0-9]{2}[0-9]{4})
    \z
  }x

  def initialize(phone_number)
    @phone_number = phone_number
  end

  def clean
    format '%<area_code>s%<local_number>s', blocks if blocks
  end

private
  attr_reader :phone_number

  def digits
    phone_number.gsub(/\D/, '')
  end

  def blocks
    matches = digits.match(NANP)
    matches.names.map(&:to_sym).zip(matches.captures).to_h if matches
  end
end
