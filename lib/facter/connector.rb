Facter.add(:rubrik_connector) do
  setcode do
    rubrik_connector= ""
    case Facter.value(:kernel) 
    when 'windows' || 'Windows'
      status = system( "powershell (Get-Service 'Rubrik Backup Service').status") 
      if status == true
        rubrik_connector="Installed"
      else 
        rubrik_connector=""
      end
    end
  end
end
