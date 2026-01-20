# prtg_exporter
A very simple example of how to make [PRTG Network Monitor](https://www.paessler.com/prtg) metrics available to [Prometheus](https://prometheus.io/).

prtg-exporter-core uses [PrtgAPI](https://github.com/lordmilko/PrtgAPI) to receive the metrics and
[prometheus-net](https://github.com/prometheus-net/prometheus-net) to export metrics to Prometheus.


![Grafana](https://raw.githubusercontent.com/luke-777/prtg_exporter/main/images/grafana.PNG)

![Prometheus](https://raw.githubusercontent.com/luke-777/prtg_exporter/main/images/prometheus.PNG)


## How to use

1. Adjust your config in prtgexporter.json
2. Run 'docker build . -t prtg_exporter'
3. Run 'docker run -d --name prtg_exporter --network monitoring prtg_exporter'

I HIGHLY recommend, not to expose the container to the public. Use Dockers Networking, to connect it to prometheus. 

Configuration File prtgexporter.json
```json
{
	"PRTG": {
		"Server": "http://localhost",
		"Username": "yourapiuser",
		"Password": "yourpassword"
	},

	"Exporter": {
		"Port": "1234",
		"RefreshInterval": 120
	}
}
```

ALL CREDITS TO https://github.com/luke-777/prtg_exporter
