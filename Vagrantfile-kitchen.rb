Vagrant.configure(2) do |config|
  config.vm.provider 'virtualbox' do |v|
    file_backed_disk = File.realpath('.').to_s + '/extra_disk.vdi'
    unless File.exist?(file_backed_disk)
      v.customize [
        'createhd',
        '--filename', file_backed_disk,
        '--format', 'VDI',
        '--size', 2 * 1024 + 512
      ]
      v.customize [
        'storageattach', :id,
        '--storagectl', 'SATA Controller', # The name may vary
        '--port', 1, '--device', 0,
        '--type', 'hdd', '--medium',
        file_backed_disk
      ]
    end
    v.customize [
      'storageattach', :id,
      '--storagectl', 'SATA Controller', # The name may vary
      '--port', 1, '--device', 0,
      '--type', 'hdd', '--medium',
      file_backed_disk
    ]
  end
end
