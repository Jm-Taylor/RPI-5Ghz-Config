# RPI-5Ghz-Config

Basic config for setting the hostapd to 5GHz for specific countries

[Useful website that shows hostapd flags](https://w1.fi/cgit/hostap/plain/hostapd/hostapd.conf)
 
To check countries valid wifi ranges, use:

```bash
im reg get
```

For setting the country use:

```bash
sudo im reg set COUNTRY_CODE
```

For Canada, this would be:

```bash
sudo im reg set CA 
```

## Running the script

```bash
./setupWifiAP5G.sh TEAM TEAM_NUMBER PASSWORD COUNTRY_CODE CHANNEL
```

Using the lookup table **5G-WIFI-LIST** it is possible for **interfaceSetUp** to get the correct index and apply it to **hostapd**. 

## Explaining hostapd 

- **hw_mode=a** Will set the interface to 5GHz
- **country_code=CA** Will set the interface to use that specific country code. Note this is required for 5GHz use.
- **vht_oper_chwidth=0** Should be set to 0 as the RPI only supports 20MHz
- **vht_oper_centr_freq_seg0_idx=0** Should be set to the index shown in () next to the channel number
- **channel=0** Should be set to the channel number required

## Some Notes

1. DFS bandwidths should not be used as weather and radar have priority. If a DFS pulse is sent out, this will halt the wifi for the countries specific wait period. For example, 10s in Europe. 
2. Some bandwidths cannot be used outside. For example, for Canada, the **5150 - 5250** range is restricted to indoor use only. 
3. Some countries have the **5150 - 5250** & **5735 - 5835** bandwidths, whereas others only have the **5150 - 5250** bandwidths. 
4. If an incorrect channel is selected **interfaceSetUp** does not change to the selected channel.

## Country Codes with valid channels

---

### United States
 
Country Code: **US**

Valid Channels:  **36(idx 38), 40(idx 38), 44(idx 46), 149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)**

country US: DFS-FCC

- (2402 - 2472 @ 40), (N/A, 30), (N/A)
- (5170 - 5250 @ 80), (N/A, 23), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 23), (0 ms), DFS, AUTO-BW
- (5490 - 5730 @ 160), (N/A, 23), (0 ms), DFS
- (5735 - 5835 @ 80), (N/A, 30), (N/A)
- (57240 - 63720 @ 2160), (N/A, 40), (N/A)

---

### Canada
 
Country Code: **CA**

Valid Channels:  **36(idx 38), 40(idx 38), 44(idx 46), 149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)**

country CA: DFS-FCC
	
- (2402 - 2472 @ 40), (N/A, 30), (N/A)
- (5150 - 5250 @ 80), (N/A, 23), (N/A), NO-OUTDOOR, AUTO-BW
- (5250 - 5350 @ 80), (N/A, 24), (0 ms), DFS, AUTO-BW
- (5470 - 5600 @ 80), (N/A, 24), (0 ms), DFS
- (5650 - 5730 @ 80), (N/A, 24), (0 ms), DFS
- (5735 - 5835 @ 80), (N/A, 30), (N/A)
   
---

### Japan

Country Code: **JP3**

Valid Channels: **36(idx 38), 40(idx 38), 44(idx 46)**

country JP: DFS-JP

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (2474 - 2494 @ 20), (N/A, 20), (N/A), NO-OFDM
- (4910 - 4990 @ 40), (N/A, 23), (N/A)
- (5030 - 5090 @ 40), (N/A, 23), (N/A)
- (5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW
- (5490 - 5710 @ 160), (N/A, 23), (0 ms), DFS
- (59000 - 66000 @ 2160), (N/A, 10), (N/A)

---

### Germany

Country Code: **DE**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46), 149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)**

country DE: DFS-ETSI

- (2400 - 2483 @ 40), (N/A, 20), (N/A)
- (5150 - 5250 @ 80), (N/A, 20), (N/A), NO-OUTDOOR, AUTO-BW
- (5250 - 5350 @ 80), (N/A, 20), (0 ms), NO-OUTDOOR, DFS, AUTO-BW
- (5470 - 5725 @ 160), (N/A, 26), (0 ms), DFS
- (5725 - 5875 @ 80), (N/A, 13), (N/A)
- (57000 - 66000 @ 2160), (N/A, 40), (N/A)

---

### Netherlands

Country Code: **NL**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46), 149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)**

country NL: DFS-ETSI

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 80), (N/A, 20), (N/A), NO-OUTDOOR, AUTO-BW
- (5250 - 5330 @ 80), (N/A, 20), (0 ms), NO-OUTDOOR, DFS, AUTO-BW
- (5490 - 5710 @ 160), (N/A, 27), (0 ms), DFS
- (5725 - 5875 @ 80), (N/A, 13), (N/A)
- (57000 - 66000 @ 2160), (N/A, 40), (N/A)

---

### Italy

Country Code: **IT**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46)**

country IT: DFS-ETSI

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW
- (5490 - 5710 @ 160), (N/A, 27), (0 ms), DFS
- (57000 - 66000 @ 2160), (N/A, 40), (N/A)

---

### Portugal

Country Code: **PT**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46)**

country PT: DFS-ETSI

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW
- (5490 - 5710 @ 160), (N/A, 27), (0 ms), DFS
- (57000 - 66000 @ 2160), (N/A, 40), (N/A)

---   

### Luxembourg

Country Code: **LU**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46)**

country LU: DFS-ETSI

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW
- (5490 - 5710 @ 160), (N/A, 27), (0 ms), DFS
- (57000 - 66000 @ 2160), (N/A, 40), (N/A)

---

### Norway

Country Code: **NO**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46)**

country NO: DFS-ETSI

- (2400 - 2483 @ 40), (N/A, 20), (N/A)
- (5150 - 5250 @ 80), (N/A, 23), (N/A), AUTO-BW
- (5250 - 5350 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW
- (5470 - 5795 @ 160), (N/A, 26), (0 ms), DFS
- (5815 - 5850 @ 35), (N/A, 33), (0 ms), DFS
- (17100 - 17300 @ 200), (N/A, 20), (N/A)
- (57000 - 66000 @ 2160), (N/A, 40), (N/A)

---

### Finland

Country Code: **FI**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46)**

country FI: DFS-ETSI

- (2400 - 2483 @ 40), (N/A, 20), (N/A)
- (5150 - 5250 @ 80), (N/A, 23), (N/A), NO-OUTDOOR, AUTO-BW
- (5250 - 5350 @ 80), (N/A, 20), (0 ms), NO-OUTDOOR, DFS, AUTO-BW
- (5470 - 5725 @ 160), (N/A, 27), (0 ms), DFS
- (57000 - 66000 @ 2160), (N/A, 40), (N/A)

---

### Denmark

Country Code: **DK**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46)**

country DK: DFS-ETSI

- (2400 - 2483 @ 40), (N/A, 20), (N/A)
- (5150 - 5250 @ 80), (N/A, 23), (N/A), AUTO-BW
- (5250 - 5350 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW
- (5470 - 5725 @ 160), (N/A, 27), (0 ms), DFS
- (57000 - 66000 @ 2160), (N/A, 40), (N/A), NO-OUTDOOR

---

### Switzerland

Country Code: **CH**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46)**

country CH: DFS-ETSI

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW
- (5490 - 5710 @ 160), (N/A, 27), (0 ms), DFS
- (57000 - 66000 @ 2160), (N/A, 40), (N/A)

---

### Czech Replublic

Country Code: **CZ**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46)**

country CZ: DFS-ETSI

- (2400 - 2483 @ 40), (N/A, 20), (N/A)
- (5150 - 5250 @ 80), (N/A, 23), (N/A), NO-OUTDOOR, AUTO-BW
- (5250 - 5350 @ 80), (N/A, 20), (0 ms), NO-OUTDOOR, DFS, AUTO-BW
- (5470 - 5725 @ 160), (N/A, 26), (0 ms), DFS
- (57000 - 66000 @ 2160), (N/A, 40), (N/A)

--- 

### Spain

Country Code: **ES**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46), 149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)**

country ES: DFS-ETSI

- (2400 - 2483 @ 40), (N/A, 20), (N/A)
- (5150 - 5250 @ 80), (N/A, 23), (N/A), NO-OUTDOOR, AUTO-BW
- (5250 - 5350 @ 80), (N/A, 20), (0 ms), NO-OUTDOOR, DFS, AUTO-BW
- (5470 - 5725 @ 160), (N/A, 26), (0 ms), DFS
- (5725 - 5875 @ 80), (N/A, 13), (N/A)
- (57000 - 66000 @ 2160), (N/A, 40), (N/A)

---

### United Kingdom

Country Code: **GB**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46)**

country GB: DFS-ETSI

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW
- (5490 - 5710 @ 160), (N/A, 27), (0 ms), DFS
- (57000 - 66000 @ 2160), (N/A, 40), (N/A)

---

### Korea

Country Code: **KR**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46), 149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)**

country KR: DFS-JP

- (2402 - 2482 @ 40), (N/A, 13), (N/A)
- (5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW
- (5490 - 5710 @ 160), (N/A, 30), (0 ms), DFS
- (5735 - 5835 @ 80), (N/A, 30), (N/A)
- (57000 - 66000 @ 2160), (N/A, 43), (N/A)

--- 

### China

Country Code: **CN**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46), 149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)**

country CN: DFS-FCC

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 80), (N/A, 23), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 23), (0 ms), DFS, AUTO-BW
- (5735 - 5835 @ 80), (N/A, 30), (N/A)
- (57240 - 59400 @ 2160), (N/A, 28), (N/A)
- (59400 - 63720 @ 2160), (N/A, 44), (N/A)
- (63720 - 65880 @ 2160), (N/A, 28), (N/A)

---

### France

Country Code: **FR**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46)**

country FR: DFS-ETSI

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW
- (5490 - 5710 @ 160), (N/A, 27), (0 ms), DFS
- (57000 - 66000 @ 2160), (N/A, 40), (N/A)

---

### Hong Kong

Country Code: **HK**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46), 149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)**

country HK: DFS-ETSI

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 80), (N/A, 17), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 24), (0 ms), DFS, AUTO-BW
- (5490 - 5710 @ 160), (N/A, 24), (0 ms), DFS
- (5735 - 5835 @ 80), (N/A, 30), (N/A)

---

### Singapore

Country Code: **SG**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46), 149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)**

country SG: DFS-FCC

- (2400 - 2483 @ 40), (N/A, 23), (N/A)
- (5150 - 5250 @ 80), (N/A, 23), (N/A), AUTO-BW
- (5250 - 5350 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW
- (5725 - 5850 @ 80), (N/A, 30), (N/A)

---

### Taiwan

Country Code: **TW**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46), 149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)**

country TW: DFS-FCC

- (2400 - 2483 @ 40), (N/A, 30), (N/A)
- (5150 - 5250 @ 80), (N/A, 23), (N/A), AUTO-BW
- (5250 - 5350 @ 80), (N/A, 23), (0 ms), DFS, AUTO-BW
- (5470 - 5725 @ 160), (N/A, 23), (0 ms), DFS
- (5725 - 5850 @ 80), (N/A, 30), (N/A)
- (57000 - 66000 @ 2160), (N/A, 40), (N/A)

---

### Brazil

Country Code: **BR**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46), 149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)**

country BR: DFS-FCC

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 80), (N/A, 17), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 24), (0 ms), DFS, AUTO-BW
- (5490 - 5730 @ 160), (N/A, 24), (0 ms), DFS
- (5735 - 5835 @ 80), (N/A, 30), (N/A)

---

### Isreal

Country Code: **IL**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46)**

country IL: DFS-ETSI

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5150 - 5250 @ 80), (N/A, 23), (N/A), NO-OUTDOOR, AUTO-BW
- (5250 - 5350 @ 80), (N/A, 23), (0 ms), NO-OUTDOOR, DFS, AUTO-BW

---

### Saudi Arabia

Country Code: **SA**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46)**

country SA: DFS-ETSI

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW
- (5490 - 5710 @ 160), (N/A, 27), (0 ms), DFS

---

### Lebanon

Country Code: **LB**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46), 149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)**

country LB: DFS-FCC

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 80), (N/A, 17), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 24), (0 ms), DFS, AUTO-BW
- (5490 - 5730 @ 160), (N/A, 24), (0 ms), DFS
- (5735 - 5835 @ 80), (N/A, 30), (N/A)


---

### UAE

Country Code: **AE**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46), 149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)**

country AE: DFS-FCC

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 80), (N/A, 17), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 24), (0 ms), DFS, AUTO-BW
- (5490 - 5730 @ 160), (N/A, 24), (0 ms), DFS
- (5735 - 5835 @ 80), (N/A, 30), (N/A)

---

### South Africa

Country Code: **ZA**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46)**

country ZA: DFS-ETSI

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW
- (5490 - 5710 @ 160), (N/A, 30), (N/A)

---

### Argentina

Country Code: **AR**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46), 149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)**

country AR: DFS-FCC

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 80), (N/A, 17), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 24), (0 ms), DFS, AUTO-BW
- (5490 - 5730 @ 160), (N/A, 24), (0 ms), DFS
- (5735 - 5835 @ 80), (N/A, 30), (N/A)

---

### Australia

Country Code: **AU**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46), 149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)**

country AU: DFS-ETSI

- (2400 - 2483 @ 40), (N/A, 36), (N/A)
- (5150 - 5250 @ 80), (N/A, 23), (N/A), NO-OUTDOOR, AUTO-BW
- (5250 - 5350 @ 80), (N/A, 20), (0 ms), NO-OUTDOOR, DFS, AUTO-BW
- (5470 - 5600 @ 80), (N/A, 27), (0 ms), DFS
- (5650 - 5730 @ 80), (N/A, 27), (0 ms), DFS
- (5730 - 5850 @ 80), (N/A, 36), (N/A)
- (57000 - 66000 @ 2160), (N/A, 43), (N/A), NO-OUTDOOR

---

### Austria

Country Code: **AT**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46)**

country AT: DFS-ETSI

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW
- (5490 - 5710 @ 160), (N/A, 27), (0 ms), DFS
- (57000 - 66000 @ 2160), (N/A, 40), (N/A)

---

### Bolivia

Country Code: **BO**

Vaild Channels: **149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)**

country BO: DFS-JP

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5250 - 5330 @ 80), (N/A, 30), (0 ms), DFS
- (5735 - 5835 @ 80), (N/A, 30), (N/A)

---

### Chile

Country Code: **CL**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46), 149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)**

country CL: DFS-JP

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW
- (5735 - 5835 @ 80), (N/A, 20), (N/A)

---

### Greece

Country Code: **GR**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46)**

country GR: DFS-ETSI

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW
- (5490 - 5710 @ 160), (N/A, 27), (0 ms), DFS
- (57000 - 66000 @ 2160), (N/A, 40), (N/A)

---

### Iceland

Country Code: **IS**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46)**

country IS: DFS-ETSI

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW
- (5490 - 5710 @ 160), (N/A, 27), (0 ms), DFS
- (57000 - 66000 @ 2160), (N/A, 40), (N/A)

--- 

### India

Country Code: **IN**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46), 149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)**

country IN: DFS-UNSET

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5150 - 5350 @ 160), (N/A, 23), (N/A)
- (5725 - 5875 @ 80), (N/A, 23), (N/A)

---

### Ireland

Country Code: **IE**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46)**

country IE: DFS-ETSI

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW
- (5490 - 5710 @ 160), (N/A, 27), (0 ms), DFS
- (57000 - 66000 @ 2160), (N/A, 40), (N/A)

---

### Kuwait

Country Code: **KW**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46)**

country KW: DFS-ETSI

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW

---

### Liechtenstein

Country Code: **LI**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46)**

country LI: DFS-ETSI

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW
- (5490 - 5710 @ 160), (N/A, 27), (0 ms), DFS

---

### Lithuania

Country Code: **LT**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46)**

country LT: DFS-ETSI

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW
- (5490 - 5710 @ 160), (N/A, 27), (0 ms), DFS
- (57000 - 66000 @ 2160), (N/A, 40), (N/A)

---

### Mexico

Country Code: **MX**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46), 149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)**

country MX: DFS-FCC

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 80), (N/A, 17), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 24), (0 ms), DFS, AUTO-BW
- (5490 - 5730 @ 160), (N/A, 24), (0 ms), DFS
- (5735 - 5835 @ 80), (N/A, 30), (N/A)

---

### Morocco

Country Code: **MA**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46)**

country MA: DFS-ETSI

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW

---

### New Zealand

Country Code: **NZ**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46), 149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)**

country NZ: DFS-ETSI

- (2402 - 2482 @ 40), (N/A, 30), (N/A)
- (5170 - 5250 @ 80), (N/A, 17), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 24), (0 ms), DFS, AUTO-BW
- (5490 - 5730 @ 160), (N/A, 24), (0 ms), DFS
- (5735 - 5835 @ 80), (N/A, 30), (N/A)

---

### Poland

Country Code: **PL**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46)**

country PL: DFS-ETSI

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW
- (5490 - 5710 @ 160), (N/A, 27), (0 ms), DFS
- (57000 - 66000 @ 2160), (N/A, 40), (N/A)

---

### Puerto Rico

Country Code: **PR**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46), 149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)**

country PR: DFS-FCC

- (2402 - 2472 @ 40), (N/A, 30), (N/A)
- (5170 - 5250 @ 80), (N/A, 17), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 24), (0 ms), DFS, AUTO-BW
- (5490 - 5730 @ 160), (N/A, 24), (0 ms), DFS
- (5735 - 5835 @ 80), (N/A, 30), (N/A)

---

### Slovakia

Country Code: **SK**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46)**

country SK: DFS-ETSI

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW
- (5490 - 5710 @ 160), (N/A, 27), (0 ms), DFS
- (57000 - 66000 @ 2160), (N/A, 40), (N/A)

---

### Slovenia

Country Code: **SI**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46)**

country SI: DFS-ETSI

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW
- (5490 - 5710 @ 160), (N/A, 27), (0 ms), DFS
- (57000 - 66000 @ 2160), (N/A, 40), (N/A)

---

### Thailand

Country Code: **TH**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46), 149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)**

country TH: DFS-FCC

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 80), (N/A, 17), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 24), (0 ms), DFS, AUTO-BW
- (5490 - 5730 @ 160), (N/A, 24), (0 ms), DFS
- (5735 - 5835 @ 80), (N/A, 30), (N/A)

---

### Uruguay

Country Code: **UY**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46), 149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)**

country UY: DFS-FCC

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 80), (N/A, 23), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 23), (0 ms), DFS, AUTO-BW
- (5735 - 5835 @ 80), (N/A, 30), (N/A)

---

### Panama

Country Code: **PA**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46), 149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)**

country PA: DFS-FCC

- (2402 - 2472 @ 40), (N/A, 30), (N/A)
- (5170 - 5250 @ 80), (N/A, 17), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 23), (0 ms), DFS, AUTO-BW
- (5735 - 5835 @ 80), (N/A, 30), (N/A)

---

### Russia

Country Code: **RU**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46), 149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)**

country RU: DFS-ETSI

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW
- (5650 - 5730 @ 80), (N/A, 30), (0 ms), DFS
- (5735 - 5835 @ 80), (N/A, 30), (N/A)
- (57000 - 66000 @ 2160), (N/A, 40), (N/A)

---

### Egypt

Country Code: **EG**

Vaild Channels: 

---

### Trinidad and Tobago

Country Code: **TT**

Vaild Channels: 

---

### Turkey

Country Code: **TR**

Vaild Channels: 

---

### Costa Rica

Country Code: **CR**

Vaild Channels: 

---

### Ecuador

Country Code: **EC**

Vaild Channels: 

---

### Honduras

Country Code: **HN**

Vaild Channels: 

---

### Kenya

Country Code: **KE**

Vaild Channels: 

---

### Ukraine

Country Code: **UA**

Vaild Channels: 

---

### Vietnam

Country Code: **VN**

Vaild Channels: 

---

### Bulgaria

Country Code: **BG**

Vaild Channels: 

---

### Cyprus

Country Code: **CY**

Vaild Channels: 

---

### Estonia

Country Code: **EE**

Vaild Channels: 

---

### Mauritius

Country Code: **MU**

Vaild Channels: 

---

### Romania

Country Code: **RO**

Vaild Channels: 

---

### Serbia / Montenegro

Country Code: **CS**

Vaild Channels: 

---

### Indonesia

Country Code: **ID**

Vaild Channels: 

---

### Peru

Country Code: **PE**

Vaild Channels: 

---

### Venezuela

Country Code: **VE**

Vaild Channels: 

---

### Jamaica

Country Code: **JM**

Vaild Channels: 

---

### Bahrain

Country Code: **BH**

Vaild Channels: 

---

### Oman

Country Code: **OM**

Vaild Channels: 

---

### Jordan

Country Code: **JO**

Vaild Channels: 

---

### Bermuda

Country Code: **BM**

Vaild Channels: 

---

### Columbia

Country Code: **CO**

Vaild Channels: 

---

### Dominican Replublic

Country Code: **DO**

Vaild Channels: 

---

### Gutaemala

Country Code: **GT**

Vaild Channels: 

---

### Philippines

Country Code: **PH**

Vaild Channels: 

---

### Sri Lanka

Country Code: **LK**

Vaild Channels: 

---

### El Salvador

Country Code: **SV**

Vaild Channels: 

---

### Tunisia

Country Code: **TN**

Vaild Channels: 

---

### Pakistan

Country Code: **PK**

Vaild Channels: 

---

### Qatar

Country Code: **QA**

Vaild Channels: 

---

### Algeria

Country Code: **DZ**

Vaild Channels: 
