require_relative '../../test_helper'
require 'fileutils'

describe AgileUtils do

  context '#tar_gzip_files' do
    before do
      FileUtils.rm_rf("test/fixtures/output.tar.gz")
      @files = AgileUtils::FileUtil.find("test/fixtures/outputs", 'xhtml')
    end

    after do
      FileUtils.rm_rf("test/fixtures/output.tar.gz")
    end

    it 'compresses list of files' do
      refute File.exists?("test/fixtures/output.tar.gz"), "Output file must not exist"
      AgileUtils::FileUtil.tar_gzip_files(@files, "test/fixtures/output.tar.gz")
      assert File.exists?("test/fixtures/output.tar.gz"), "Output file must be generated"
    end
  end

  # context '#delete' do
  #   it 'removes the files' do
  #     @files.wont_be_empty
  #     AgileUtils::FileUtil.delete(@files)
  #
  #   end
  # end

end
