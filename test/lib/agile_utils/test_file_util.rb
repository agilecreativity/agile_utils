require_relative '../../test_helper'
require 'fileutils'

describe AgileUtils do

  context '#tar_gzip_files' do
    before do
      FileUtils.rm_rf('test/fixtures/output.tar.gz')
      @files = AgileUtils::FileUtil.find('test/fixtures/outputs', 'xhtml')
    end

    after do
      FileUtils.rm_rf('test/fixtures/output.tar.gz')
    end

    it 'compresses list of files' do
      refute File.exist?('test/fixtures/output.tar.gz'), 'Output file must not exist'
      AgileUtils::FileUtil.tar_gzip_files(@files, 'test/fixtures/output.tar.gz')
      assert File.exist?('test/fixtures/output.tar.gz'), 'Output file must be generated'
    end
  end
end
