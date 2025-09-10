{ username, inputs, config, ... }: {

  sops = {
    defaultSopsFile = ../secrets.yaml;
    age = {
      sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
      keyFile = "/var/lib/sops-nix/key.txt";
      generateKey = true;
    };
	secrets = {
	  "api-keys/gemini-api-key".owner = username;
	};
  };
}
