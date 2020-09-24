# Perform a basic scan (passive) via CLI
docker run -t owasp/zap2docker-weekly zap-baseline.py -t <url>

# Perform a basic scan (passive) via CLI and generate a report
docker run -v $(pwd):/zap/wrk/:rw -t owasp/zap2docker-stable zap-baseline.py  -t <url> -g gen.conf -r testreport.html

# Perform a full scan (passive and active) via CLI
docker run -t owasp/zap2docker-stable zap-full-scan.py -t https://www.example.com

# Perform a full scan (passive and active) via CLI and generate a report
docker run -v $(pwd):/zap/wrk/:rw -t owasp/zap2docker-stable zap-full-scan.py -t <url> -g gen.conf -r testreport.html
