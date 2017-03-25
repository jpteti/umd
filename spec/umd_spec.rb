require "spec_helper"

describe Umd do
  it "has a version number" do
    expect(Umd::VERSION).not_to be nil
  end

  it "returns courses" do
    expect(Umd::UMD.courses).not_to be nil
  end

  it "returns the number of courses specified" do
    expect(Umd::UMD.courses(per_page: 2).parsed_response.count).to be 2
  end
end
