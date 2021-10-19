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

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46)**

country EG: DFS-ETSI

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 40), (N/A, 20), (N/A)
- (5250 - 5330 @ 40), (N/A, 20), (0 ms), DFS

---

### Trinidad and Tobago

Country Code: **TT**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46), 149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)**

country TT: DFS-FCC

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 80), (N/A, 17), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 24), (0 ms), DFS, AUTO-BW
- (5490 - 5730 @ 160), (N/A, 24), (0 ms), DFS
- (5735 - 5835 @ 80), (N/A, 30), (N/A)

---

### Turkey

Country Code: **TR**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46)**

country TR: DFS-ETSI

- (2400 - 2483 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 80), (N/A, 23), (N/A), NO-OUTDOOR, AUTO-BW
- (5250 - 5330 @ 80), (N/A, 20), (0 ms), NO-OUTDOOR, DFS, AUTO-BW
- (5470 - 5725 @ 160), (N/A, 27), (0 ms), DFS
- (57000 - 66000 @ 2160), (N/A, 40), (N/A)

---

### Costa Rica

Country Code: **CR**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46), 149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)**

country CR: DFS-FCC

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 20), (N/A, 17), (N/A)
- (5250 - 5330 @ 20), (N/A, 24), (0 ms), DFS
- (5490 - 5730 @ 20), (N/A, 24), (0 ms), DFS
- (5735 - 5835 @ 20), (N/A, 30), (N/A)

---

### Ecuador

Country Code: **EC**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46), 149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)**

country EC: DFS-FCC

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 20), (N/A, 17), (N/A)
- (5250 - 5330 @ 20), (N/A, 24), (0 ms), DFS
- (5490 - 5730 @ 20), (N/A, 24), (0 ms), DFS
- (5735 - 5835 @ 20), (N/A, 30), (N/A)

---

### Honduras

Country Code: **HN**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46), 149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)**

country HN: DFS-FCC

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 80), (N/A, 17), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 24), (0 ms), DFS, AUTO-BW
- (5490 - 5730 @ 160), (N/A, 24), (0 ms), DFS
- (5735 - 5835 @ 80), (N/A, 30), (N/A)

---

### Kenya

Country Code: **KE**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46), 149(idx 151), 153(idx 151)**

country KE: DFS-JP

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 80), (N/A, 23), (N/A)
- (5490 - 5570 @ 80), (N/A, 30), (0 ms), DFS
- (5735 - 5775 @ 40), (N/A, 23), (N/A)

---

### Ukraine

Country Code: **UA**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46), 149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)**

country UA: DFS-ETSI

- (2400 - 2483 @ 40), (N/A, 20), (N/A), NO-OUTDOOR
- (5150 - 5250 @ 80), (N/A, 20), (N/A), NO-OUTDOOR, AUTO-BW
- (5250 - 5350 @ 80), (N/A, 20), (0 ms), NO-OUTDOOR, DFS, AUTO-BW
- (5490 - 5670 @ 160), (N/A, 20), (0 ms), DFS
- (5735 - 5835 @ 80), (N/A, 20), (N/A)
- (57000 - 66000 @ 2160), (N/A, 40), (N/A)

---

### Vietnam

Country Code: **VN**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46), 149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)**

country VN: DFS-FCC

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 80), (N/A, 17), (N/A)
- (5250 - 5330 @ 80), (N/A, 24), (0 ms), DFS
- (5490 - 5730 @ 80), (N/A, 24), (0 ms), DFS
- (5735 - 5835 @ 80), (N/A, 30), (N/A)

---

### Bulgaria

Country Code: **BG**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46), 149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)**

country BG: DFS-ETSI

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 80), (N/A, 23), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW
- (5490 - 5710 @ 160), (N/A, 27), (0 ms), DFS
- (5725 - 5875 @ 80), (N/A, 14), (N/A)
- (57000 - 66000 @ 2160), (N/A, 40), (N/A), NO-OUTDOOR

---

### Cyprus

Country Code: **CY**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46)**

country CY: DFS-ETSI

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW
- (5490 - 5710 @ 160), (N/A, 27), (0 ms), DFS
- (57000 - 66000 @ 2160), (N/A, 40), (N/A)

---

### Estonia

Country Code: **EE**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46)**

country EE: DFS-ETSI

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW
- (5490 - 5710 @ 160), (N/A, 27), (0 ms), DFS
- (57000 - 66000 @ 2160), (N/A, 40), (N/A)

---

### Mauritius

Country Code: **MU**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46), 149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)**

country MU: DFS-FCC

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 80), (N/A, 24), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 24), (0 ms), DFS, AUTO-BW
- (5490 - 5730 @ 160), (N/A, 24), (0 ms), DFS
- (5735 - 5835 @ 80), (N/A, 30), (N/A)

---

### Romania

Country Code: **RO**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46)**

country RO: DFS-ETSI

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW
- (5490 - 5710 @ 160), (N/A, 27), (0 ms), DFS
- (57000 - 66000 @ 2160), (N/A, 40), (N/A)

---

### Serbia

Country Code: **RS**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46)**

country RS: DFS-ETSI

- (2400 - 2483 @ 40), (N/A, 20), (N/A)
- (5150 - 5350 @ 40), (N/A, 23), (N/A), NO-OUTDOOR
- (5470 - 5725 @ 20), (N/A, 30), (0 ms), DFS
- (57000 - 66000 @ 2160), (N/A, 40), (N/A)

---

### Montenegro

Country Code: **MNE**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46)**

country ME: DFS-ETSI

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW
- (5490 - 5710 @ 160), (N/A, 27), (0 ms), DFS

---

### Indonesia

Country Code: **ID**

Vaild Channels: **149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)**

country ID: DFS-JP

- (2402 - 2482 @ 20), (N/A, 20), (N/A)
- (5735 - 5815 @ 20), (N/A, 23), (N/A)

---

### Peru

Country Code: **PE**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46), 149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)**

country PE: DFS-FCC

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 80), (N/A, 17), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 24), (0 ms), DFS, AUTO-BW
- (5490 - 5730 @ 160), (N/A, 24), (0 ms), DFS
- (5735 - 5835 @ 80), (N/A, 30), (N/A)

---

### Venezuela

Country Code: **VE**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46), 149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)**

country VE: DFS-FCC

- (2402 - 2482 @ 40), (N/A, 30), (N/A)
- (5170 - 5250 @ 80), (N/A, 23), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 23), (0 ms), DFS, AUTO-BW
- (5735 - 5835 @ 80), (N/A, 30), (N/A)

---

### Jamaica

Country Code: **JM**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46), 149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)**

country JM: DFS-FCC

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 80), (N/A, 17), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 24), (0 ms), DFS, AUTO-BW
- (5490 - 5730 @ 160), (N/A, 24), (0 ms), DFS
- (5735 - 5835 @ 80), (N/A, 30), (N/A)

---

### Bahrain

Country Code: **BH**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46), 149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)**

country BH: DFS-JP

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 20), (N/A, 20), (N/A)
- (5250 - 5330 @ 20), (N/A, 20), (0 ms), DFS
- (5735 - 5835 @ 20), (N/A, 20), (N/A)

---

### Oman

Country Code: **OM**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46)**

country OM: DFS-ETSI

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW
- (5490 - 5710 @ 160), (N/A, 27), (0 ms), DFS

---

### Jordan

Country Code: **JO**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46), 149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)**

country JO: DFS-JP

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 80), (N/A, 23), (N/A)
- (5735 - 5835 @ 80), (N/A, 23), (N/A)

---

### Bermuda

Country Code: **BM**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46), 149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)**

country BM: DFS-FCC

- (2402 - 2472 @ 40), (N/A, 30), (N/A)
- (5170 - 5250 @ 80), (N/A, 24), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 24), (0 ms), DFS, AUTO-BW
- (5490 - 5730 @ 160), (N/A, 24), (0 ms), DFS
- (5735 - 5835 @ 80), (N/A, 30), (N/A)

---

### Columbia

Country Code: **CO**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46), 149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)**

country CO: DFS-FCC

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 80), (N/A, 17), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 24), (0 ms), DFS, AUTO-BW
- (5490 - 5730 @ 160), (N/A, 24), (0 ms), DFS
- (5735 - 5835 @ 80), (N/A, 30), (N/A)

---

### Dominican Replublic

Country Code: **DO**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46), 149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)**

country DO: DFS-FCC

- (2402 - 2472 @ 40), (N/A, 30), (N/A)
- (5170 - 5250 @ 80), (N/A, 17), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 23), (0 ms), DFS, AUTO-BW
- (5735 - 5835 @ 80), (N/A, 30), (N/A)

---

### Gutaemala

Country Code: **GT**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46), 149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)**

country GT: DFS-FCC

- (2402 - 2472 @ 40), (N/A, 30), (N/A)
- (5170 - 5250 @ 80), (N/A, 17), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 23), (0 ms), DFS, AUTO-BW
- (5735 - 5835 @ 80), (N/A, 30), (N/A)

---

### Philippines

Country Code: **PH**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46), 149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)**

country PH: DFS-FCC

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 80), (N/A, 17), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 24), (0 ms), DFS, AUTO-BW
- (5490 - 5730 @ 160), (N/A, 24), (0 ms), DFS
- (5735 - 5835 @ 80), (N/A, 30), (N/A)

---

### Sri Lanka

Country Code: **LK**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46), 149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)**

country LK: DFS-FCC

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 20), (N/A, 17), (N/A)
- (5250 - 5330 @ 20), (N/A, 24), (0 ms), DFS
- (5490 - 5730 @ 20), (N/A, 24), (0 ms), DFS
- (5735 - 5835 @ 20), (N/A, 30), (N/A)

---

### El Salvador

Country Code: **SV**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46), 149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)**

country SV: DFS-FCC

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 20), (N/A, 17), (N/A)
- (5250 - 5330 @ 20), (N/A, 23), (0 ms), DFS
- (5735 - 5835 @ 20), (N/A, 30), (N/A)

---

### Tunisia

Country Code: **TN**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46)**

country TN: DFS-ETSI

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW

---

### Pakistan

Country Code: **PK**

Vaild Channels: **149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)**

country PK: DFS-JP

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5735 - 5835 @ 80), (N/A, 30), (N/A)

---

### Qatar

Country Code: **QA**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46), 149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)**

country QA: DFS-ETSI

- (2400 - 2483 @ 40), (N/A, 20), (N/A), NO-OUTDOOR
- (5150 - 5250 @ 80), (N/A, 23), (N/A), NO-OUTDOOR, AUTO-BW
- (5250 - 5350 @ 80), (N/A, 23), (0 ms), NO-OUTDOOR, DFS, AUTO-BW
- (5470 - 5725 @ 160), (N/A, 20), (0 ms), NO-OUTDOOR, DFS
- (5725 - 5875 @ 80), (N/A, 20), (0 ms), NO-OUTDOOR, DFS
- (57000 - 66000 @ 2160), (N/A, 40), (N/A), NO-OUTDOOR

---

### Algeria

Country Code: **DZ**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46)**

country DZ: DFS-JP

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 80), (N/A, 23), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 23), (0 ms), DFS, AUTO-BW
- (5490 - 5670 @ 160), (N/A, 23), (0 ms), DFS
