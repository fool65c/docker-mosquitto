Runs a mosquitto server

You must export the Config dir and data dir before running

```bash
 export MOSQUITTO_CONFIG_DIR=<LOCATION>
```

If this is the first time setting this us run: 
```bash
docker run -ti -v ${MOSQUITTO_CONFIG_DIR}:/config <container_id> mosquitto_passwd -c /config/pwfile <MOSTUITTO_USER>
 ```
}
