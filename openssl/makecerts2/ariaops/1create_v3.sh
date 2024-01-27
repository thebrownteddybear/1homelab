cat > v3.ext <<-EOF
[req]
prompt = no
distinguished_name = dn
req_extensions = ext
default_bits = 2048
default_md = sha256
encrypt_key = no

[dn]
CN = aops.govtech.sg

[ext]
subjectAltName = @alt_names

[alt_names]
DNS.1 = aops.govtech.sg
DNS.4 = aops
IP.1 = 10.1.1.1
EOF